<?php

namespace Models;

use Conexao\DataBaseConnect;
use PDO;

class NotificationManager {
    private $pdo;
    private $user_id;
    
    public function __construct(DataBaseConnect $dbConnect, $user_id = 1) {
        $this->pdo = $dbConnect->pdo;
        $this->user_id = $user_id;
    }
    
    /**
     * Criar uma nova notificação
     */
    public function createNotification($activity_id, $activity_type, $notification_type, $title, $message) {
        // Verificar se já não foi enviada uma notificação igual nas últimas 24h
        if ($this->isDuplicateNotification($activity_id, $activity_type, $notification_type)) {
            return false;
        }
        
        $sql = "INSERT INTO notification_history 
                (user_id, activity_id, activity_type, notification_type, title, message, sent_at)
                VALUES (:user_id, :activity_id, :activity_type, :notification_type, :title, :message, NOW())";
        
        try {
            $stmt = $this->pdo->prepare($sql);
            return $stmt->execute([
                ':user_id' => $this->user_id,
                ':activity_id' => $activity_id,
                ':activity_type' => $activity_type,
                ':notification_type' => $notification_type,
                ':title' => $title,
                ':message' => $message
            ]);
        } catch (\Exception $e) {
            error_log("Erro ao criar notificação: " . $e->getMessage());
            return false;
        }
    }
    
    /**
     * Obter notificações não lidas
     */
    public function getUnreadNotifications($limit = 20) {
        $sql = "SELECT * FROM unread_notifications 
                WHERE user_id = :user_id 
                ORDER BY sent_at DESC 
                LIMIT :limit";
        
        try {
            $stmt = $this->pdo->prepare($sql);
            $stmt->bindValue(':user_id', $this->user_id, PDO::PARAM_INT);
            $stmt->bindValue(':limit', $limit, PDO::PARAM_INT);
            $stmt->execute();
            return $stmt->fetchAll(PDO::FETCH_ASSOC);
        } catch (\Exception $e) {
            error_log("Erro ao obter notificações não lidas: " . $e->getMessage());
            return [];
        }
    }
    
    /**
     * Obter todas as notificações recentes
     */
    public function getRecentNotifications($limit = 50) {
        $sql = "SELECT 
                    nh.*,
                    CASE 
                        WHEN nh.activity_type = 'assign' THEN a.name
                        WHEN nh.activity_type = 'quiz' THEN q.name
                    END as activity_name,
                    CASE 
                        WHEN nh.activity_type = 'assign' THEN c_a.fullname
                        WHEN nh.activity_type = 'quiz' THEN c_q.fullname
                    END as course_name
                FROM notification_history nh
                LEFT JOIN mdl_assign a ON nh.activity_id = a.id AND nh.activity_type = 'assign'
                LEFT JOIN mdl_course c_a ON a.course = c_a.id
                LEFT JOIN mdl_quiz q ON nh.activity_id = q.id AND nh.activity_type = 'quiz'
                LEFT JOIN mdl_course c_q ON q.course = c_q.id
                WHERE nh.user_id = :user_id
                ORDER BY nh.sent_at DESC
                LIMIT :limit";
        
        try {
            $stmt = $this->pdo->prepare($sql);
            $stmt->bindValue(':user_id', $this->user_id, PDO::PARAM_INT);
            $stmt->bindValue(':limit', $limit, PDO::PARAM_INT);
            $stmt->execute();
            return $stmt->fetchAll(PDO::FETCH_ASSOC);
        } catch (\Exception $e) {
            error_log("Erro ao obter notificações recentes: " . $e->getMessage());
            return [];
        }
    }
    
    /**
     * Marcar notificação como lida
     */
    public function markAsRead($notification_id) {
        $sql = "UPDATE notification_history 
                SET is_read = 1, read_at = NOW() 
                WHERE id = :id AND user_id = :user_id";
        
        try {
            $stmt = $this->pdo->prepare($sql);
            return $stmt->execute([
                ':id' => $notification_id,
                ':user_id' => $this->user_id
            ]);
        } catch (\Exception $e) {
            error_log("Erro ao marcar notificação como lida: " . $e->getMessage());
            return false;
        }
    }
    
    /**
     * Marcar todas as notificações como lidas
     */
    public function markAllAsRead() {
        $sql = "UPDATE notification_history 
                SET is_read = 1, read_at = NOW() 
                WHERE user_id = :user_id AND is_read = 0";
        
        try {
            $stmt = $this->pdo->prepare($sql);
            return $stmt->execute([':user_id' => $this->user_id]);
        } catch (\Exception $e) {
            error_log("Erro ao marcar todas como lidas: " . $e->getMessage());
            return false;
        }
    }
    
    /**
     * Contar notificações não lidas
     */
    public function countUnread() {
        $sql = "SELECT COUNT(*) as total 
                FROM notification_history 
                WHERE user_id = :user_id AND is_read = 0";
        
        try {
            $stmt = $this->pdo->prepare($sql);
            $stmt->execute([':user_id' => $this->user_id]);
            $result = $stmt->fetch(PDO::FETCH_ASSOC);
            return (int)$result['total'];
        } catch (\Exception $e) {
            error_log("Erro ao contar não lidas: " . $e->getMessage());
            return 0;
        }
    }
    
    /**
     * Obter estatísticas de notificações
     */
    public function getStats() {
        $sql = "SELECT * FROM notification_stats WHERE user_id = :user_id";
        
        try {
            $stmt = $this->pdo->prepare($sql);
            $stmt->execute([':user_id' => $this->user_id]);
            $stats = $stmt->fetch(PDO::FETCH_ASSOC);
            
            if (!$stats) {
                return [
                    'total_notifications' => 0,
                    'unread_count' => 0,
                    'deadline_warnings' => 0,
                    'activity_changes' => 0
                ];
            }
            
            return $stats;
        } catch (\Exception $e) {
            error_log("Erro ao obter estatísticas: " . $e->getMessage());
            return [
                'total_notifications' => 0,
                'unread_count' => 0,
                'deadline_warnings' => 0,
                'activity_changes' => 0
            ];
        }
    }
    
    /**
     * Verificar se é uma notificação duplicada (mesma atividade, tipo nas últimas 24h)
     */
    private function isDuplicateNotification($activity_id, $activity_type, $notification_type) {
        $sql = "SELECT COUNT(*) as total 
                FROM notification_history 
                WHERE user_id = :user_id 
                AND activity_id = :activity_id 
                AND activity_type = :activity_type 
                AND notification_type = :notification_type 
                AND sent_at > DATE_SUB(NOW(), INTERVAL 24 HOUR)";
        
        try {
            $stmt = $this->pdo->prepare($sql);
            $stmt->execute([
                ':user_id' => $this->user_id,
                ':activity_id' => $activity_id,
                ':activity_type' => $activity_type,
                ':notification_type' => $notification_type
            ]);
            $result = $stmt->fetch(PDO::FETCH_ASSOC);
            return (int)$result['total'] > 0;
        } catch (\Exception $e) {
            error_log("Erro ao verificar duplicação: " . $e->getMessage());
            return false;
        }
    }
    
    /**
     * Limpar notificações antigas (mais de 30 dias)
     */
    public function cleanOldNotifications($days = 30) {
        $sql = "DELETE FROM notification_history 
                WHERE sent_at < DATE_SUB(NOW(), INTERVAL :days DAY)";
        
        try {
            $stmt = $this->pdo->prepare($sql);
            $stmt->execute([':days' => $days]);
            return $stmt->rowCount();
        } catch (\Exception $e) {
            error_log("Erro ao limpar notificações antigas: " . $e->getMessage());
            return 0;
        }
    }
}
