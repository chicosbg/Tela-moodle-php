<?php

namespace Models;

use Conexao\DataBaseConnect;
use PDO;

class MoodleDataFetcher {
    private $pdo;
    
    public function __construct(DataBaseConnect $dbConnect) {
        $this->pdo = $dbConnect->pdo;
    }
    
    public function getAtividadesPendentes() {
        $sql = "
            SELECT
                a.id,
                a.name AS titulo,
                a.duedate AS data_entrega,
                'TAREFA' AS tipo,
                'assign' AS tipo_tabela,
                c.fullname as curso
            FROM
                mdl_assign a
            LEFT JOIN mdl_course c on c.id = a.course  
            WHERE
                a.duedate > UNIX_TIMESTAMP()
            
            UNION ALL

            SELECT
                q.id,
                q.name AS titulo,
                q.timeclose AS data_entrega,
                'QUESTIONÁRIO' AS tipo,
                'quiz' AS tipo_tabela,
                c.fullname as curso
            FROM
                mdl_quiz q
            LEFT JOIN mdl_course c on c.id = q.course  
            WHERE
                q.timeclose > UNIX_TIMESTAMP()
            ORDER BY
                data_entrega ASC
            LIMIT 50
        ";
        
        try {
            $stmt = $this->pdo->prepare($sql);
            $stmt->execute();
            return $stmt->fetchAll(PDO::FETCH_ASSOC);
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
            $notificacoes_hoje = $stmt->fetch(PDO::FETCH_ASSOC)['total'];
        } catch (\Exception $e) {
            $notificacoes_hoje = count($atividades);
        }
        
        return [
            'total_pendentes' => count($atividades),
            'entregas_7_dias' => $entregas_7_dias,
            'notificacoes_hoje' => $notificacoes_hoje
        ];
    }
    
    public function getProximosEventos() {
        $sql = "
            SELECT 
                e.name as titulo,
                e.timestart as data_evento,
                'evento' as tipo
            FROM mdl_event e
            WHERE e.timestart > UNIX_TIMESTAMP()
            AND e.timestart < UNIX_TIMESTAMP() + (30 * 24 * 60 * 60)
            
            UNION ALL
            
            SELECT 
                a.name as titulo,
                a.duedate as data_evento,
                CONCAT('tarefa_', a.id) as tipo
            FROM mdl_assign a
            WHERE a.duedate > UNIX_TIMESTAMP()
            AND a.duedate < UNIX_TIMESTAMP() + (7 * 24 * 60 * 60)
            
            UNION ALL
            
            SELECT 
                q.name as titulo,
                q.timeclose as data_evento,
                CONCAT('quiz_', q.id) as tipo
            FROM mdl_quiz q
            WHERE q.timeclose > UNIX_TIMESTAMP()
            AND q.timeclose < UNIX_TIMESTAMP() + (7 * 24 * 60 * 60)
            
            ORDER BY data_evento ASC
            LIMIT 15
        ";
        
        try {
            $stmt = $this->pdo->prepare($sql);
            $stmt->execute();
            return $stmt->fetchAll(PDO::FETCH_ASSOC);
        } catch (\Exception $e) {
            error_log("Erro ao buscar eventos: " . $e->getMessage());
            return [];
        }
    }
}