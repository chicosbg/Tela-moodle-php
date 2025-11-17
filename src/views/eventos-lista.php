<?php 
require_once "utils/TimeUtils.php";
use Utils\TimeUtils;
?>
   <!-- Próximos eventos -->
    <div class="card">
        <h2>📅 Próximos Eventos</h2>
        <div class="list">
            <?php if (empty($eventos)): ?>
                <div class="empty-message">Nenhum evento próximo</div>
            <?php else: ?>
                <?php foreach ($eventos as $evento): 
                    $dias_restantes = TimeUtils::calcularDiasRestantes($evento['data_evento']);
                ?>
                    <div class="list-item">
                        <div class="item-header">
                            <strong><?php echo is_null($evento['titulo']) ? 'Nao informado' : $evento['titulo']; ?></strong>
                            <span class="badge"><?php echo $dias_restantes; ?> dia<?php echo $dias_restantes != 1 ? 's' : ''; ?></span>
                        </div>
                        <div class="item-details">
                            <?php if (!empty($evento['curso'])): ?>
                                <span class="curso"><?php echo is_null($evento['curso']) ? 'Nao informado' : $evento['curso']; ?></span>
                            <?php endif; ?>
                            <span class="data">📅 <?php echo TimeUtils::formatarData($evento['data_evento']); ?></span>
                            <span class="sigla">EVENTO</span>
                        </div>
                    </div>
                <?php endforeach; ?>
            <?php endif; ?>
        </div>
    </div>
</div>