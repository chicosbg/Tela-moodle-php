<?php

namespace Models;

use Conexao\DataBaseConnect;

class MoodleDataFetcher {
    private $pdo;
    
    public function __construct(DataBaseConnect $dbConnect) {
        $this->pdo = $dbConnect->pdo;
    }
    
    public function getAtividadesPendentes() {
        $sql = "
            SELECT 
                a.id,
                a.name as titulo,
                c.fullname as curso,
                a.duedate as data_entrega,
                'TAREFA' as tipo,
                'assign' as tipo_tabela
            FROM mdl_assign a
            JOIN mdl_course c ON a.course = c.id
            WHERE a.duedate > UNIX_TIMESTAMP()
            ORDER BY a.duedate ASC
            
            UNION ALL
            
            SELECT 
                q.id,
                q.name as titulo,
                c.fullname as curso,
                q.timeclose as data_entrega,
                'QUESTIONÁRIO' as tipo,
                'quiz' as tipo_tabela
            FROM mdl_quiz q
            JOIN mdl_course c ON q.course = c.id
            WHERE q.timeclose > UNIX_TIMESTAMP()
            ORDER BY data_entrega ASC
            LIMIT 50
        ";
        
        try {
            $stmt = $this->pdo->prepare($sql);
            $stmt->execute();
            return $stmt->fetchAll(\PDO::FETCH_ASSOC);
        } catch (\Exception $e) {
            error_log("Erro ao buscar atividades: " . $e->getMessage());
            return [];
        }
    }
    
    public function getEstatisticas($atividades) {
        $agora = time();
        $sete_dias = $agora + (7 * 24 * 60 * 60);
        
        // Contar entregas em 7 dias
        $entregas_7_dias = 0;
        foreach ($atividades as $atividade) {
            if ($atividade['data_entrega'] <= $sete_dias) {
                $entregas_7_dias++;
            }
        }
        
        // Contar cursos ativos com atividades
        $cursos_ativos = 0;
        $cursos_vistos = [];
        foreach ($atividades as $atividade) {
            if (!in_array($atividade['curso'], $cursos_vistos)) {
                $cursos_ativos++;
                $cursos_vistos[] = $atividade['curso'];
            }
        }
        
        // Notificações hoje (baseado em atividades criadas hoje)
        $sql_notificacoes = "
            SELECT COUNT(*) as total 
            FROM (
                SELECT id FROM mdl_assign 
                WHERE timecreated > UNIX_TIMESTAMP(CURRENT_DATE())
                UNION ALL
                SELECT id FROM mdl_quiz 
                WHERE timecreated > UNIX_TIMESTAMP(CURRENT_DATE())
            ) as atividades_hoje
        ";
        
        try {
            $stmt = $this->pdo->prepare($sql_notificacoes);
            $stmt->execute();
            $notificacoes_hoje = $stmt->fetch(\PDO::FETCH_ASSOC)['total'];
        } catch (\Exception $e) {
            $notificacoes_hoje = count($atividades);
        }
        
        return [
            'total_pendentes' => count($atividades),
            'entregas_7_dias' => $entregas_7_dias,
            'notificacoes_hoje' => $notificacoes_hoje,
            'cursos_ativos' => $cursos_ativos
        ];
    }
    
    public function getProximosEventos() {
        $sql = "
            SELECT 
                e.name as titulo,
                c.fullname as curso,
                e.timestart as data_evento,
                'evento' as tipo
            FROM mdl_event e
            LEFT JOIN mdl_course c ON e.courseid = c.id
            WHERE e.timestart > UNIX_TIMESTAMP()
            AND e.timestart < UNIX_TIMESTAMP() + (30 * 24 * 60 * 60)
            
            UNION ALL
            
            SELECT 
                a.name as titulo,
                c.fullname as curso,
                a.duedate as data_evento,
                CONCAT('tarefa_', a.id) as tipo
            FROM mdl_assign a
            JOIN mdl_course c ON a.course = c.id
            WHERE a.duedate > UNIX_TIMESTAMP()
            AND a.duedate < UNIX_TIMESTAMP() + (7 * 24 * 60 * 60)
            
            UNION ALL
            
            SELECT 
                q.name as titulo,
                c.fullname as curso,
                q.timeclose as data_evento,
                CONCAT('quiz_', q.id) as tipo
            FROM mdl_quiz q
            JOIN mdl_course c ON q.course = c.id
            WHERE q.timeclose > UNIX_TIMESTAMP()
            AND q.timeclose < UNIX_TIMESTAMP() + (7 * 24 * 60 * 60)
            
            ORDER BY data_evento ASC
            LIMIT 15
        ";
        
        try {
            $stmt = $this->pdo->prepare($sql);
            $stmt->execute();
            return $stmt->fetchAll(\PDO::FETCH_ASSOC);
        } catch (\Exception $e) {
            error_log("Erro ao buscar eventos: " . $e->getMessage());
            return [];
        }
    }
}

// Funções auxiliares (helpers)
function formatarData($timestamp) {
    return date('d/m/Y H:i', $timestamp);
}

function calcularDiasRestantes($timestamp) {
    $agora = time();
    $diferenca = $timestamp - $agora;
    return ceil($diferenca / (24 * 60 * 60));
}

function isUrgente($dias) {
    return $dias <= 7;
}
?>