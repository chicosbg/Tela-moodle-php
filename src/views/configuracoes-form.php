<div class="config-container">
    <div class="card">
        <h2>⚙️ Configurações de Notificações</h2>
        
        <?php if ($success): ?>
            <div class="alert alert-success">
                ✅ <?php echo htmlspecialchars($success); ?>
            </div>
        <?php endif; ?>
        
        <?php if ($error): ?>
            <div class="alert alert-error">
                ⚠️ <?php echo htmlspecialchars($error); ?>
            </div>
        <?php endif; ?>
        
        <form method="POST" action="configuracoes.php" class="config-form">
            <!-- Notificações de Prazos -->
            <div class="form-section">
                <h3>Notificações de Prazos</h3>
                
                <div class="form-group">
                    <label class="checkbox-label" style="display:block; cursor:pointer;">
                        <input type="checkbox" 
                               name="notify_deadlines" 
                               value="1"
                               style="vertical-align:middle;"
                               <?php echo $preferences['notify_deadlines'] ? 'checked' : ''; ?>>
                        <span>Ativar notificações de prazos próximos</span>
                    </label>
                </div>
                
                <div class="form-group">
                    <label for="hours_before_deadline">
                        Notificar quantas horas antes do prazo?
                    </label>
                    <div class="input-with-unit">
                        <input type="number" 
                               id="hours_before_deadline" 
                               name="hours_before_deadline" 
                               min="1" 
                               max="720" 
                               value="<?php echo $preferences['hours_before_deadline']; ?>"
                               required>
                        <span class="unit">horas</span>
                    </div>
                    <small class="help-text">
                        Valor recomendado: 24 horas (1 dia) ou 48 horas (2 dias)
                    </small>
                </div>
            </div>
            
            <!-- Horários de Silêncio -->
            <div class="form-section">
                <h3>Horário de Silêncio</h3>
                <p class="section-description">
                    Durante este período, nenhuma notificação será enviada.
                </p>
                
                <div class="form-row">
                    <div class="form-group">
                        <label for="silence_start_time">
                            Início do silêncio
                        </label>
                        <input type="time" 
                               id="silence_start_time" 
                               name="silence_start_time" 
                               value="<?php echo substr($preferences['silence_start_time'], 0, 5); ?>"
                               required>
                    </div>
                    
                    <div class="form-group">
                        <label for="silence_end_time">
                            Fim do silêncio
                        </label>
                        <input type="time" 
                               id="silence_end_time" 
                               name="silence_end_time" 
                               value="<?php echo substr($preferences['silence_end_time'], 0, 5); ?>"
                               required>
                    </div>
                </div>
                
                <small class="help-text">
                    Exemplo: 22:00 até 08:00 (não receber notificações durante a noite)
                </small>
            </div>
            
            <!-- Botões de Ação -->
            <div class="form-actions">
                <button type="submit" class="btn btn-primary">
                    Salvar Configurações
                </button>
                <a href="index.php" class="btn btn-secondary">
                    ← Voltar ao Dashboard
                </a>
            </div>
        </form>
    </div>
    
    <!-- Informações Adicionais -->
    <!-- <div class="card info-card">
        <h3>ℹ️ Sobre as Notificações</h3>
        <ul class="info-list">
            <li>
                <strong>Notificações de Prazos:</strong> 
                Você receberá um alerta quando uma atividade estiver próxima do prazo configurado.
            </li>
            <li>
                <strong>Horário de Silêncio:</strong> 
                Nenhuma notificação será enviada durante o período configurado, garantindo seu descanso.
            </li>
            <li>
                <strong>Alterações em Atividades:</strong> 
                Fique informado quando professores modificarem prazos, títulos ou descrições de atividades.
            </li>
            <li>
                <strong>Motor de Notificações:</strong> 
                O sistema verifica automaticamente novas atividades e mudanças a cada poucos minutos.
            </li>
        </ul>
    </div> -->
</div>
