<?php

namespace Models;

use Conexao\DataBaseConnect;
use PDO;

class ActivityTracker {
    private $pdo;
    
    public function __construct(DataBaseConnect $dbConnect) {
        $this->pdo = $dbConnect->pdo;
    }
    
    /**
     * Criar ou atualizar snapshot de uma atividade
     */
    public function saveSnapshot($activity_id, $activity_type, $data) {
        $snapshot_json = json_encode($data, JSON_UNESCAPED_UNICODE);
        
        $sql = "INSERT INTO activity_snapshots (activity_id, activity_type, snapshot_data)
                VALUES (:activity_id, :activity_type, :snapshot_data)
                ON DUPLICATE KEY UPDATE 
                    snapshot_data = :snapshot_data,
                    created_at = CURRENT_TIMESTAMP";
        
        try {
            $stmt = $this->pdo->prepare($sql);
            return $stmt->execute([
                ':activity_id' => $activity_id,
                ':activity_type' => $activity_type,
                ':snapshot_data' => $snapshot_json
            ]);
        } catch (\Exception $e) {
            error_log("Erro ao salvar snapshot: " . $e->getMessage());
            return false;
        }
    }
    
    /**
     * Obter snapshot anterior de uma atividade
     */
    public function getSnapshot($activity_id, $activity_type) {
        $sql = "SELECT snapshot_data, created_at 
                FROM activity_snapshots 
                WHERE activity_id = :activity_id AND activity_type = :activity_type";
        
        try {
            $stmt = $this->pdo->prepare($sql);
            $stmt->execute([
                ':activity_id' => $activity_id,
                ':activity_type' => $activity_type
            ]);
            $result = $stmt->fetch(PDO::FETCH_ASSOC);
            
            if ($result) {
                return json_decode($result['snapshot_data'], true);
            }
            return null;
        } catch (\Exception $e) {
            error_log("Erro ao obter snapshot: " . $e->getMessage());
            return null;
        }
    }
    
    /**
     * Detectar mudanças em uma atividade
     */
    public function detectChanges($activity_id, $activity_type, $current_data) {
        $old_snapshot = $this->getSnapshot($activity_id, $activity_type);
        
        // Se não existe snapshot anterior, criar um e retornar sem mudanças
        if (!$old_snapshot) {
            $this->saveSnapshot($activity_id, $activity_type, $current_data);
            return [];
        }
        
        $changes = [];
        
        // Verificar mudanças nos campos principais
        $fields_to_check = [
            'name' => 'Título',
            'duedate' => 'Prazo de entrega',
            'timeclose' => 'Data de encerramento',
            'intro' => 'Descrição'
        ];
        
        foreach ($fields_to_check as $field => $label) {
            if (!isset($current_data[$field])) {
                continue;
            }
            
            $old_value = $old_snapshot[$field] ?? null;
            $new_value = $current_data[$field];
            
            if ($old_value !== $new_value) {
                $changes[] = [
                    'field' => $field,
                    'label' => $label,
                    'old_value' => $old_value,
                    'new_value' => $new_value
                ];
            }
        }
        
        // Se houve mudanças, atualizar o snapshot
        if (!empty($changes)) {
            $this->saveSnapshot($activity_id, $activity_type, $current_data);
        }
        
        return $changes;
    }
    
    /**
     * Sincronizar snapshots de todas as atividades pendentes
     */
    public function syncAllActivities() {
        $activities_synced = 0;
        $changes_detected = [];
        
        // Buscar todas as tarefas pendentes
        $assigns = $this->getAllAssignments();
        foreach ($assigns as $assign) {
            $changes = $this->detectChanges($assign['id'], 'assign', $assign);
            if (!empty($changes)) {
                $changes_detected[] = [
                    'activity_id' => $assign['id'],
                    'activity_type' => 'assign',
                    'activity_name' => $assign['name'],
                    'changes' => $changes
                ];
            }
            $activities_synced++;
        }
        
        // Buscar todos os questionários pendentes
        $quizzes = $this->getAllQuizzes();
        foreach ($quizzes as $quiz) {
            $changes = $this->detectChanges($quiz['id'], 'quiz', $quiz);
            if (!empty($changes)) {
                $changes_detected[] = [
                    'activity_id' => $quiz['id'],
                    'activity_type' => 'quiz',
                    'activity_name' => $quiz['name'],
                    'changes' => $changes
                ];
            }
            $activities_synced++;
        }
        
        return [
            'activities_synced' => $activities_synced,
            'changes_detected' => $changes_detected
        ];
    }
    
    /**
     * Obter todas as tarefas ativas
     */
    private function getAllAssignments() {
        $sql = "SELECT id, name, duedate, intro, timemodified, course
                FROM mdl_assign
                WHERE duedate > UNIX_TIMESTAMP()
                ORDER BY duedate ASC";
        
        try {
            $stmt = $this->pdo->prepare($sql);
            $stmt->execute();
            return $stmt->fetchAll(PDO::FETCH_ASSOC);
        } catch (\Exception $e) {
            error_log("Erro ao obter assignments: " . $e->getMessage());
            return [];
        }
    }
    
    /**
     * Obter todos os questionários ativos
     */
    private function getAllQuizzes() {
        $sql = "SELECT id, name, timeclose, intro, timemodified, course
                FROM mdl_quiz
                WHERE timeclose > UNIX_TIMESTAMP()
                ORDER BY timeclose ASC";
        
        try {
            $stmt = $this->pdo->prepare($sql);
            $stmt->execute();
            return $stmt->fetchAll(PDO::FETCH_ASSOC);
        } catch (\Exception $e) {
            error_log("Erro ao obter quizzes: " . $e->getMessage());
            return [];
        }
    }
    
    /**
     * Formatar mudanças para mensagem legível
     */
    public function formatChangesMessage($changes) {
        $messages = [];
        
        foreach ($changes as $change) {
            $old = $change['old_value'];
            $new = $change['new_value'];
            
            // Formatar valores especiais (timestamps, etc)
            if (in_array($change['field'], ['duedate', 'timeclose'])) {
                $old = $old ? date('d/m/Y H:i', $old) : 'Não definido';
                $new = $new ? date('d/m/Y H:i', $new) : 'Não definido';
            }
            
            // Truncar textos longos
            if (strlen($old) > 100) {
                $old = substr($old, 0, 100) . '...';
            }
            if (strlen($new) > 100) {
                $new = substr($new, 0, 100) . '...';
            }
            
            $messages[] = "{$change['label']}: '{$old}' → '{$new}'";
        }
        
        return implode("\n", $messages);
    }
    
    /**
     * Limpar snapshots antigos (atividades que já passaram)
     */
    public function cleanOldSnapshots() {
        $sql = "DELETE s FROM activity_snapshots s
                LEFT JOIN mdl_assign a ON s.activity_id = a.id AND s.activity_type = 'assign'
                LEFT JOIN mdl_quiz q ON s.activity_id = q.id AND s.activity_type = 'quiz'
                WHERE (s.activity_type = 'assign' AND (a.id IS NULL OR a.duedate < UNIX_TIMESTAMP()))
                   OR (s.activity_type = 'quiz' AND (q.id IS NULL OR q.timeclose < UNIX_TIMESTAMP()))";
        
        try {
            $stmt = $this->pdo->prepare($sql);
            $stmt->execute();
            return $stmt->rowCount();
        } catch (\Exception $e) {
            error_log("Erro ao limpar snapshots antigos: " . $e->getMessage());
            return 0;
        }
    }
}
