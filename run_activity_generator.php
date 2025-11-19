<?php

require_once 'src/conexao/DataBaseConnect.php';
require_once 'ActivityGenerator/MoodleActivityGenerator.php';
require_once 'vendor/autoload.php';

use Conexao\DataBaseConnect;
use ActivityGenerator\MoodleActivityGenerator;


use Dotenv\Dotenv;

$dotenv = Dotenv::createImmutable(__DIR__);
$dotenv->load();

// Configurações
$config = [
    'tempo_espera' => 10,      // Segundos entre cada atividade
    'max_atividades' => 10,    // Máximo de atividades a criar
    'curso_padrao' => 2,       // ID do curso padrão
    'log_file' => 'moodle_activity_generator.log'
];

// Modo de execução (cli ou web)
$is_cli = php_sapi_name() === 'cli';

if ($is_cli) {
    // Modo CLI - verifica argumentos
    $options = getopt('f', ['foreground']);
    $run_foreground = isset($options['f']) || isset($options['foreground']);
    
    // Check if we SHOULD fork and if we CAN fork (Linux/Mac only)
    if (!$run_foreground && function_exists('pcntl_fork')) {
        // Daemon simples para segundo plano (Linux/Unix)
        $pid = pcntl_fork();
        if ($pid == -1) {
            die("Erro ao criar processo filho\n");
        } elseif ($pid) {
            // Processo pai
            echo "Gerador de atividades iniciado em segundo plano (PID: $pid)\n";
            echo "Logs em: {$config['log_file']}\n";
            exit(0);
        }
        // Processo filho continua aqui...
    } elseif (!$run_foreground && !function_exists('pcntl_fork')) {
        // Fallback for Windows
        echo "---------------------------------------------------------\n";
        echo "AVISO: PCNTL não disponível (Ambiente Windows detectado).\n";
        echo "O script executará em PRIMEIRO PLANO (Foreground).\n";
        echo "Para parar o script, pressione CTRL + C.\n";
        echo "---------------------------------------------------------\n\n";
    }
}

try {
    // Inicializa conexão e gerador
    $dbConnect = new DataBaseConnect();
    $generator = new MoodleActivityGenerator($dbConnect, $config);
    
    if ($is_cli) {
        $generator->run();
    } else {
        // Modo web - executa uma única atividade para demonstração
        echo "<pre>";
        echo "Gerador de Atividades Moodle - Modo Web\n";
        echo "=======================================\n";
        
        // Cria apenas uma atividade para demonstração
        $config_demo = $config;
        $config_demo['max_atividades'] = 1;
        $generator_demo = new MoodleActivityGenerator($dbConnect, $config_demo);
        $generator_demo->run();
        
        echo "\nPara execução contínua, execute via linha de comando.\n";
        echo "</pre>";
    }
    
} catch (Exception $e) {
    $error_msg = "Erro: " . $e->getMessage();
    if ($is_cli) {
        echo $error_msg . "\n";
    } else {
        echo "<pre>$error_msg</pre>";
    }
    error_log($error_msg);
}
