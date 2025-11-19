<?php 
require_once "utils/TimeUtils.php";
use Utils\TimeUtils;
?>

<!-- Notificações Recentes -->
<div class="card">
    <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px;">
        <h2 style="margin: 0;">
            Notificações por Email
            <?php if ($notificacoes_nao_lidas > 0): ?>
                <span class="notification-badge"><?php echo $notificacoes_nao_lidas; ?></span>
            <?php endif; ?>
        </h2>
        <a href="configuracoes.php" class="btn btn-secondary" style="font-size: 0.9em; padding: 8px 16px;">
            ⚙️ Configurações
        </a>
    </div>
    
    <div class="list">
        <?php if (empty($notificacoes)): ?>
            <div class="empty-message">
                Nenhuma notificação no momento
            </div>
        <?php else: ?>
            <?php foreach ($notificacoes as $notificacao): 
                $is_unread = !$notificacao['is_read'];
                $is_deadline = $notificacao['notification_type'] === 'deadline_warning';
                $is_change = $notificacao['notification_type'] === 'activity_change';
                
                $class = 'notification-item';
                if ($is_unread) $class .= ' unread';
                if ($is_deadline) $class .= ' deadline';
                if ($is_change) $class .= ' change';
            ?>
                <div class="<?php echo $class; ?>">
                    <div class="notification-header">
                        <div class="notification-title">
                            <?php echo htmlspecialchars($notificacao['title']); ?>
                        </div>
                        <div class="notification-time">
                            <?php echo TimeUtils::formatarTempoRelativo(strtotime($notificacao['sent_at'])); ?>
                        </div>
                    </div>
                    
                    <div class="notification-message">
                        <?php echo htmlspecialchars($notificacao['message']); ?>
                    </div>
                    
                    <?php if ($notificacao['course_name']): ?>
                        <div class="item-details" style="margin-top: 8px;">
                            <span class="curso">
                                <?php echo htmlspecialchars($notificacao['course_name']); ?>
                            </span>
                            <?php if ($notificacao['activity_name']): ?>
                                <span class="data">
                                    📚 <?php echo htmlspecialchars($notificacao['activity_name']); ?>
                                </span>
                            <?php endif; ?>
                        </div>
                    <?php endif; ?>
                </div>
            <?php endforeach; ?>
            
            <?php if ($notificacoes_nao_lidas > 0): ?>
                <div style="text-align: center; margin-top: 15px;">
                    <a href="marcar_lidas.php" class="btn btn-secondary" style="font-size: 0.9em;">
                        Marcar todas como lidas
                    </a>
                </div>
            <?php endif; ?>
        <?php endif; ?>
    </div>
</div>
