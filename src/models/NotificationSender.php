<?php

namespace Models;

use Conexao\DataBaseConnect;

require_once __DIR__ . '/NotificationManager.php';
require_once __DIR__ . '/UserPreferences.php';
require_once __DIR__ . '/ActivityTracker.php';

use Controller\EmailController;
use Models\NotificationManager;
use Models\UserPreferences;
use Models\ActivityTracker;

class NotificationSender {
    private $pdo;
    private $notificationManager;
    private $userPreferences;
    private $activityTracker;
    
    public function __construct(DataBaseConnect $dbConnect, $user_id = 1) {
        $this->pdo = $dbConnect->pdo;
        $this->notificationManager = new NotificationManager($dbConnect, $user_id);
        $this->userPreferences = new UserPreferences($dbConnect, $user_id);
        $this->activityTracker = new ActivityTracker($dbConnect);
    }
    
    /**
     * Processar notificações de prazos
     */
    public function processDeadlineNotifications() {
        if (!$this->userPreferences->notifyDeadlinesEnabled()) {
            return ['status' => 'disabled', 'sent' => 0];
        }
        
        if ($this->userPreferences->isInSilencePeriod()) {
            return ['status' => 'silence_period', 'sent' => 0];
        }
        
        $hours_before = $this->userPreferences->getHoursBeforeDeadline();
        $activities = $this->getActivitiesNearDeadline($hours_before);
        
        $sent = 0;
        $msgSuccess = 'fail';
        foreach ($activities as $activity) {
            $success = $this->sendDeadlineNotification($activity);
            if ($success) {
                $sent++;
                $msgSuccess = 'sucess';
            }
        }
        
        return ['status' => $msgSuccess, 'sent' => $sent];
    }
    
    /**
     * Processar notificações de mudanças
     */
    public function processChangeNotifications() {
        if (!$this->userPreferences->notifyChangesEnabled()) {
            return ['status' => 'disabled', 'detected' => 0, 'sent' => 0];
        }
        
        if ($this->userPreferences->isInSilencePeriod()) {
            return ['status' => 'silence_period', 'detected' => 0, 'sent' => 0];
        }
        
        $result = $this->activityTracker->syncAllActivities();
        
        $sent = 0;
        foreach ($result['changes_detected'] as $change) {
            $success = $this->sendChangeNotification($change);
            if ($success) {
                $sent++;
            }
        }
        
        return [
            'status' => 'success',
            'detected' => count($result['changes_detected']),
            'sent' => $sent
        ];
    }
    
    /**
     * Enviar notificação de prazo próximo
     */
    private function sendDeadlineNotification($activity) {
        $hours_before = $this->userPreferences->getHoursBeforeDeadline();
        
        $deadline_field = $activity['activity_type'] === 'assign' ? 'duedate' : 'timeclose';
        $deadline = $activity[$deadline_field];
        
        $hours_remaining = ($deadline - time()) / 3600;
        $days_remaining = ceil($hours_remaining / 24);
        
        $title = "⏰ Prazo próximo: {$activity['titulo']}";
        
        $message = "A atividade '{$activity['titulo']}' do curso '{$activity['curso']}' vence em ";
        
        if ($hours_remaining < 24) {
            $message .= round($hours_remaining) . " horas";
        } else {
            $message .= $days_remaining . " dias";
        }
        
        $message .= " (até " . date('d/m/Y H:i', $deadline) . ")";
        
        return $this->notificationManager->createNotification(
            $activity['id'],
            $activity['activity_type'],
            'deadline_warning',
            $title,
            $message
        );
    }
    
    /**
     * Enviar notificação de mudança em atividade
     */
    private function sendChangeNotification($change) {
        $title = "🔄 Alteração: {$change['activity_name']}";
        
        $message = "A atividade '{$change['activity_name']}' foi modificada:\n\n";
        $message .= $this->activityTracker->formatChangesMessage($change['changes']);
        
        return $this->notificationManager->createNotification(
            $change['activity_id'],
            $change['activity_type'],
            'activity_change',
            $title,
            $message
        );
    }
    
    /**
     * Obter atividades próximas do prazo
     */
    private function getActivitiesNearDeadline($hours_before) {
        $now = time();
        $deadline_threshold = $now + ($hours_before * 3600);
        
        // Buscar tarefas
        $sql_assign = "
            SELECT 
                a.id,
                a.name AS titulo,
                c.fullname AS curso,
                a.duedate,
                'assign' AS activity_type
            FROM mdl_assign a
                JOIN mdl_course c ON a.course = c.id
            WHERE a.duedate > :now 
            AND a.duedate <= :threshold
        ";
        
        // Buscar questionários
        $sql_quiz = "
            SELECT 
                q.id,
                q.name AS titulo,
                c.fullname AS curso,
                q.timeclose,
                'quiz' AS activity_type
            FROM mdl_quiz q
                JOIN mdl_course c ON q.course = c.id
            WHERE q.timeclose > :now 
            AND q.timeclose <= :threshold
        ";
        
        $activities = [];
        
        try {
            // Tarefas
            $stmt = $this->pdo->prepare($sql_assign);
            $stmt->execute([':now' => $now, ':threshold' => $deadline_threshold]);
            $assigns = $stmt->fetchAll(\PDO::FETCH_ASSOC);
            $activities = array_merge($activities, $assigns);
            
            // Questionários
            $stmt = $this->pdo->prepare($sql_quiz);
            $stmt->execute([':now' => $now, ':threshold' => $deadline_threshold]);
            $quizzes = $stmt->fetchAll(\PDO::FETCH_ASSOC);
            $activities = array_merge($activities, $quizzes);
            
        } catch (\Exception $e) {
            error_log("Erro ao buscar atividades próximas do prazo: " . $e->getMessage());
        }
        
        return $activities;
    }
    
    /**
     * Processar todas as notificações (prazos + mudanças)
     */
    public function processAllNotifications() {
        $results = [];
        
        $results['deadlines'] = $this->processDeadlineNotifications();
        $results['changes'] = $this->processChangeNotifications();
        
        return $results;
    }
    
    /**
     * Enviar notificação de teste
     */
    public function sendTestNotification() {
        return $this->notificationManager->createNotification(
            0,
            'system',
            'test',
            '✅ Teste de Notificação',
            'Sistema de notificações está funcionando corretamente! Data/Hora: ' . date('d/m/Y H:i:s')
        );
    }
}
