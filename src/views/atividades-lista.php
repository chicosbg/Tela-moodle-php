<?php 
    require_once "utils/TimeUtils.php";
    use Utils\TimeUtils;
?>

<!-- Grade de conteúdo -->
<div class="content-grid">
    <!-- Próximas entregas (7 dias) -->
    <div class="card">
        <h2>🎯 Próximas Entregas (7 dias)</h2>
        <div class="list">
            <?php 
            
            $entregas_7_dias = array_filter($atividades, function($atividade) {
                return TimeUtils::calcularDiasRestantes($atividade['data_entrega']) <= 7;
            });
            
            if (empty($entregas_7_dias)): ?>
                <div class="empty-message">Nenhuma entrega nos próximos 7 dias</div>
            <?php else: ?>
                <?php foreach ($entregas_7_dias as $atividade): 
                    $dias_restantes = TimeUtils::calcularDiasRestantes($atividade['data_entrega']);
                ?>
                    <div class="list-item urgente-item">
                        <div class="item-header">
                            <strong><?php echo is_null($atividade['titulo']) ? 'Nao informado' : $atividade['titulo'] ; ?></strong>
                            <span class="badge urgente"><?php echo $dias_restantes; ?> dia<?php echo $dias_restantes != 1 ? 's' : ''; ?></span>
                        </div>
                        <div class="item-details">
                            <span class="curso"><?php echo is_null($atividade['curso']) ? 'Nao informado' : $atividade['curso'] ; ?></span>
                            <span class="data">📅 <?php echo TimeUtils::formatarData($atividade['data_entrega']); ?></span>
                            <span class="sigla"><?php echo $atividade['tipo']; ?></span>
                        </div>
                    </div>
                <?php endforeach; ?>
            <?php endif; ?>
        </div>
    </div>

    <!-- Todas as atividades pendentes -->
    <div class="card">
        <h2>📝 Todas as Atividades Pendentes</h2>
        <div class="list">
            <?php if (empty($atividades)): ?>
                <div class="empty-message">Nenhuma atividade pendente</div>
            <?php else: ?>
                <?php foreach ($atividades as $atividade): 
                    $dias_restantes = TimeUtils::calcularDiasRestantes($atividade['data_entrega']);
                    $is_urgente = TimeUtils::isUrgente($dias_restantes);
                ?>
                    <div class="list-item <?php echo $is_urgente ? 'urgente-item' : ''; ?>">
                        <div class="item-header">
                            <strong><?php echo is_null($atividade['titulo']) ? 'Nao informado' : $atividade['titulo']; ?></strong>
                            <span class="badge <?php echo $is_urgente ? 'urgente' : ''; ?>">
                                <?php echo $dias_restantes; ?> dia<?php echo $dias_restantes != 1 ? 's' : ''; ?>
                            </span>
                        </div>
                        <div class="item-details">
                            <span class="curso"><?php echo is_null($atividade['curso']) ? 'Nao informado' : $atividade['curso']; ?></span>
                            <span class="data">📅 <?php echo TimeUtils::formatarData($atividade['data_entrega']); ?></span>
                            <span class="sigla"><?php echo $atividade['tipo']; ?></span>
                        </div>
                    </div>
                <?php endforeach; ?>
            <?php endif; ?>
        </div>
    </div>