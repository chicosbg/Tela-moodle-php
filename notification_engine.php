<?php

require_once 'src/conexao/DataBaseConnect.php';
require_once 'src/models/NotificationSender.php';
require_once 'vendor/autoload.php';

use Conexao\DataBaseConnect;
use Models\NotificationSender;

use Dotenv\Dotenv;

$dotenv = Dotenv::createImmutable(__DIR__);
$dotenv->load();


/**
 * Motor de Notificações Moodle
 * 
 * Script que processa automaticamente as notificações do sistema:
 * - Verifica atividades próximas do prazo
 * - Detecta mudanças em atividades
 * - Respeita horários de silêncio
 * - Registra notificações enviadas
 * 
 * Pode ser executado via:
 * - CLI: php notification_engine.php
 * - Cron: 5 * * * * php /path/to/notification_engine.php
 * - Daemon: php notification_engine.php --daemon
 */

// Configurações
$config = [
    'check_interval' => 300,    // 5 minutos entre verificações (modo daemon)
    'user_id' => 1,             // ID do usuário (pode ser parametrizado)
    'log_file' => 'notification_engine.log',
    'daemon_mode' => false
];

// Modo de execução
$is_cli = php_sapi_name() === 'cli';

if ($is_cli) {
    // Verificar argumentos de linha de comando
    $options = getopt('d', ['daemon', 'once', 'test']);
    
    $config['daemon_mode'] = isset($options['d']) || isset($options['daemon']);
    $run_once = isset($options['once']);
    $test_mode = isset($options['test']);
    
    if (!$config['daemon_mode'] && !$run_once && !$test_mode) {
        // Modo padrão: executar uma vez
        $run_once = true;
    }
}

/**
 * Função principal de processamento
 */
function processNotifications($user_id, $test_mode = false) {
    try {
        $dbConnect = new DataBaseConnect();
        $sender = new NotificationSender($dbConnect, $user_id);
        
        if ($test_mode) {
            logMessage("Modo de teste - Enviando notificação de teste...");
            $result = $sender->sendTestNotification();
            
            if ($result) {
                logMessage("✅ Notificação de teste enviada com sucesso!");
                return ['status' => 'success', 'test' => true];
            } else {
                logMessage("❌ Erro ao enviar notificação de teste");
                return ['status' => 'error', 'test' => true];
            }
        }
        
        logMessage("Iniciando processamento de notificações...");
        
        // Processar todas as notificações
        $results = $sender->processAllNotifications();
        
        // Log dos resultados
        logMessage("Notificações de Prazos: " . $results['deadlines']['status'] . 
                   " - Enviadas: " . $results['deadlines']['sent']);
        
        logMessage("Notificações de Mudanças: " . $results['changes']['status'] . 
                   " - Detectadas: " . ($results['changes']['detected'] ?? 0) . 
                   " - Enviadas: " . $results['changes']['sent']);
        
        return $results;
        
    } catch (Exception $e) {
        logMessage("ERRO: " . $e->getMessage());
        return ['status' => 'error', 'message' => $e->getMessage()];
    }
}

/**
 * Função de logging
 */
function logMessage($message) {
    global $config;
    
    $timestamp = date('Y-m-d H:i:s');
    $log_message = "[{$timestamp}] {$message}\n";
    
    // Log para arquivo
    file_put_contents($config['log_file'], $log_message, FILE_APPEND | LOCK_EX);
    
    // Se estiver no CLI, também mostra no console
    if (php_sapi_name() === 'cli') {
        echo $log_message;
    }
}

/**
 * Executar em modo daemon (segundo plano)
 */
function runDaemon($config) {
    logMessage("Iniciando motor de notificações em modo daemon...");
    logMessage("Intervalo de verificação: {$config['check_interval']} segundos");
    logMessage("Pressione Ctrl+C para interromper");
    
    $iteration = 0;
    
    while (true) {
        $iteration++;
        logMessage("=== Iteração #{$iteration} ===");
        
        processNotifications($config['user_id']);
        
        logMessage("Aguardando {$config['check_interval']} segundos...\n");
        sleep($config['check_interval']);
    }
}

/**
 * Executar uma única vez
 */
function runOnce($config, $test_mode = false) {
    if ($test_mode) {
        logMessage("=== Modo de Teste ===");
    } else {
        logMessage("=== Execução Única ===");
    }
    
    $results = processNotifications($config['user_id'], $test_mode);
    
    logMessage("Processamento concluído!");
    
    return $results;
}

// ============================================
// EXECUÇÃO PRINCIPAL
// ============================================

if ($is_cli) {
    try {
        if (isset($test_mode)) {
            // Modo de teste
            runOnce($config, true);
        } elseif ($config['daemon_mode']) {
            // Modo daemon (segundo plano contínuo)
            // Tentar fazer fork do processo
            if (function_exists('pcntl_fork')) {
                $pid = pcntl_fork();
                
                if ($pid == -1) {
                    die("Erro ao criar processo daemon\n");
                } elseif ($pid) {
                    // Processo pai
                    echo "Motor de notificações iniciado em segundo plano (PID: $pid)\n";
                    echo "Logs em: {$config['log_file']}\n";
                    exit(0);
                }
                // Processo filho continua
            }
            
            runDaemon($config);
        } else {
            // Execução única (padrão para cron)
            $results = runOnce($config, false);
            exit(0);
        }
    } catch (Exception $e) {
        logMessage("ERRO FATAL: " . $e->getMessage());
        exit(1);
    }
} else {
    // Modo web (demonstração)
    echo "<pre>";
    echo "Motor de Notificações Moodle - Modo Web\n";
    echo "========================================\n\n";
    
    try {
        $results = processNotifications($config['user_id']);
        
        echo "\nResultados:\n";
        echo "- Notificações de Prazos: " . $results['deadlines']['sent'] . " enviadas\n";
        echo "- Mudanças Detectadas: " . ($results['changes']['detected'] ?? 0) . "\n";
        echo "- Notificações de Mudanças: " . $results['changes']['sent'] . " enviadas\n";
        
        echo "\n✅ Processamento concluído!\n";
        echo "\nPara execução contínua, execute via linha de comando:\n";
        echo "  php notification_engine.php --daemon\n";
        echo "\nPara execução única (ideal para cron):\n";
        echo "  php notification_engine.php --once\n";
        echo "\nPara testar o sistema:\n";
        echo "  php notification_engine.php --test\n";
        
    } catch (Exception $e) {
        echo "ERRO: " . $e->getMessage() . "\n";
    }
    
    echo "</pre>";
}
