<?php

namespace Models;

use Conexao\DataBaseConnect;
use PDO;

class UserPreferences {
    private $pdo;
    private $user_id;
    
    public function __construct(DataBaseConnect $dbConnect, $user_id = 1) {
        $this->pdo = $dbConnect->pdo;
        $this->user_id = $user_id;
    }
    
    /**
     * Obter preferências do usuário
     */
    public function getPreferences() {
        $sql = "SELECT * FROM notification_preferences WHERE user_id = :user_id";
        
        try {
            $stmt = $this->pdo->prepare($sql);
            $stmt->execute([':user_id' => $this->user_id]);
            $prefs = $stmt->fetch(PDO::FETCH_ASSOC);
            
            // Se não existir, criar com valores padrão
            if (is_null($prefs)) {
                $this->createDefaultPreferences();
                return $this->getPreferences();
            }
            
            return $prefs;
        } catch (\Exception $e) {
            error_log("Erro ao obter preferências: " . $e->getMessage());
            return $this->getDefaultPreferences();
        }
    }
    
    /**
     * Atualizar preferências do usuário
     */
    public function updatePreferences($data) {
        $sql = "UPDATE notification_preferences 
                SET hours_before_deadline = :hours_before_deadline,
                    silence_start_time = :silence_start_time,
                    silence_end_time = :silence_end_time,
                    notify_changes = :notify_changes,
                    notify_deadlines = :notify_deadlines,
                    updated_at = CURRENT_TIMESTAMP
                WHERE user_id = :user_id";
        
        try {
            $stmt = $this->pdo->prepare($sql);
            return $stmt->execute([
                ':user_id' => $this->user_id,
                ':hours_before_deadline' => $data['hours_before_deadline'] ?? 24,
                ':silence_start_time' => $data['silence_start_time'] ?? '22:00:00',
                ':silence_end_time' => $data['silence_end_time'] ?? '08:00:00',
                ':notify_changes' => isset($data['notify_changes']) ? (int)$data['notify_changes'] : 1,
                ':notify_deadlines' => isset($data['notify_deadlines']) ? (int)$data['notify_deadlines'] : 1
            ]);
        } catch (\Exception $e) {
            error_log("Erro ao atualizar preferências: " . $e->getMessage());
            return false;
        }
    }
    
    /**
     * Verificar se está em horário de silêncio
     */
    public function isInSilencePeriod() {
        $prefs = $this->getPreferences();
        $now = date('H:i:s');
        
        $start = $prefs['silence_start_time'];
        $end = $prefs['silence_end_time'];
        
        // Se o período cruza a meia-noite (ex: 22:00 até 08:00)
        if ($start > $end) {
            return ($now >= $start || $now < $end);
        } else {
            // Período normal no mesmo dia
            return ($now >= $start && $now < $end);
        }
    }
    
    /**
     * Obter horas antes do prazo configuradas
     */
    public function getHoursBeforeDeadline() {
        $prefs = $this->getPreferences();
        return (int)$prefs['hours_before_deadline'];
    }
    
    /**
     * Verificar se notificações de mudanças estão ativas
     */
    public function notifyChangesEnabled() {
        $prefs = $this->getPreferences();
        return (bool)$prefs['notify_changes'];
    }
    
    /**
     * Verificar se notificações de prazos estão ativas
     */
    public function notifyDeadlinesEnabled() {
        $prefs = $this->getPreferences();
        return (bool)$prefs['notify_deadlines'];
    }
    
    /**
     * Criar preferências padrão para o usuário
     */
    private function createDefaultPreferences() {
        $sql = "INSERT INTO notification_preferences 
                (user_id, hours_before_deadline, silence_start_time, silence_end_time, notify_changes, notify_deadlines)
                VALUES (:user_id, 24, '22:00:00', '08:00:00', 1, 1)";
        
        try {
            $stmt = $this->pdo->prepare($sql);
            $stmt->execute([':user_id' => $this->user_id]);
            return true;
        } catch (\Exception $e) {
            error_log("Erro ao criar preferências padrão: " . $e->getMessage());
            return false;
        }
    }
    
    /**
     * Retornar preferências padrão como fallback
     */
    private function getDefaultPreferences() {
        return [
            'user_id' => $this->user_id,
            'hours_before_deadline' => 24,
            'silence_start_time' => '22:00:00',
            'silence_end_time' => '08:00:00',
            'notify_changes' => 1,
            'notify_deadlines' => 1
        ];
    }
}
