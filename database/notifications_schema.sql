-- ============================================
-- Sistema de Notificações Moodle
-- Script de Criação das Tabelas
-- ============================================

-- Tabela de Preferências do Usuário
CREATE TABLE IF NOT EXISTS notification_preferences (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL DEFAULT 1,
    hours_before_deadline INT NOT NULL DEFAULT 24 COMMENT 'Horas antes do prazo para notificar',
    silence_start_time TIME DEFAULT '22:00:00' COMMENT 'Início do horário de silêncio',
    silence_end_time TIME DEFAULT '08:00:00' COMMENT 'Fim do horário de silêncio',
    notify_changes TINYINT(1) DEFAULT 1 COMMENT 'Notificar alterações em atividades',
    notify_deadlines TINYINT(1) DEFAULT 1 COMMENT 'Notificar prazos próximos',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    UNIQUE KEY unique_user (user_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Preferências de notificação por usuário';

-- Tabela de Histórico de Notificações
CREATE TABLE IF NOT EXISTS notification_history (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL DEFAULT 1,
    activity_id BIGINT NOT NULL COMMENT 'ID da atividade (assign ou quiz)',
    activity_type VARCHAR(20) NOT NULL COMMENT 'Tipo: assign ou quiz',
    notification_type VARCHAR(50) NOT NULL COMMENT 'Tipo: deadline_warning, activity_change',
    title VARCHAR(255) NOT NULL COMMENT 'Título da notificação',
    message TEXT COMMENT 'Mensagem da notificação',
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    is_read TINYINT(1) DEFAULT 0 COMMENT 'Se foi lida pelo usuário',
    read_at TIMESTAMP NULL COMMENT 'Quando foi lida',
    INDEX idx_user_activity (user_id, activity_id, activity_type),
    INDEX idx_sent_at (sent_at),
    INDEX idx_is_read (is_read)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Histórico de notificações enviadas';

-- Tabela de Snapshots de Atividades (para detectar mudanças)
CREATE TABLE IF NOT EXISTS activity_snapshots (
    id INT AUTO_INCREMENT PRIMARY KEY,
    activity_id BIGINT NOT NULL COMMENT 'ID da atividade',
    activity_type VARCHAR(20) NOT NULL COMMENT 'Tipo: assign ou quiz',
    snapshot_data JSON NOT NULL COMMENT 'Dados da atividade em JSON',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE KEY unique_activity (activity_id, activity_type),
    INDEX idx_created_at (created_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Snapshots de atividades para detectar mudanças';

-- Inserir preferências padrão para o usuário 1
INSERT INTO notification_preferences (user_id, hours_before_deadline, silence_start_time, silence_end_time, notify_changes, notify_deadlines)
VALUES (1, 24, '22:00:00', '08:00:00', 1, 1)
ON DUPLICATE KEY UPDATE user_id = user_id;

-- ============================================
-- Visualizações úteis
-- ============================================

-- View para notificações não lidas
CREATE OR REPLACE VIEW unread_notifications AS
SELECT 
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
WHERE nh.is_read = 0
ORDER BY nh.sent_at DESC;

-- View para estatísticas de notificações
CREATE OR REPLACE VIEW notification_stats AS
SELECT 
    user_id,
    COUNT(*) as total_notifications,
    SUM(CASE WHEN is_read = 0 THEN 1 ELSE 0 END) as unread_count,
    SUM(CASE WHEN notification_type = 'deadline_warning' THEN 1 ELSE 0 END) as deadline_warnings,
    SUM(CASE WHEN notification_type = 'activity_change' THEN 1 ELSE 0 END) as activity_changes,
    MAX(sent_at) as last_notification
FROM notification_history
GROUP BY user_id;
