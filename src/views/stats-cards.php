<!-- Cards de resumo -->
<div class="stats-grid">
    <div class="stat-card">
        <div class="stat-number"><?php echo $estatisticas['total_pendentes']; ?></div>
        <div class="stat-label">Atividades Pendentes</div>
    </div>
    <div class="stat-card <?php echo $estatisticas['entregas_7_dias'] > 0 ? 'urgente' : ''; ?>">
        <div class="stat-number"><?php echo $estatisticas['entregas_7_dias']; ?></div>
        <div class="stat-label">Entregas (7 dias)</div>
    </div>
    <div class="stat-card">
        <div class="stat-number"><?php echo $estatisticas['notificacoes_hoje']; ?></div>
        <div class="stat-label">Notificações Hoje</div>
    </div>
    <div class="stat-card">
        <div class="stat-number"><?php echo $estatisticas['cursos_ativos']; ?></div>
        <div class="stat-label">Cursos Ativos</div>
    </div>
</div>