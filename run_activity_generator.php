<?php

require_once 'src/conexao/DataBaseConnect.php';
require_once 'ActivityGenerator/MoodleActivityGenerator.php';

use Conexao\DataBaseConnect;
use ActivityGenerator\MoodleActivityGenerator;

// Configurações
$config = [
    'tempo_espera' => 30,      // Segundos entre cada atividade
    'max_atividades' => 50,    // Máximo de atividades a criar
    'curso_padrao' => 2,       // ID do curso padrão
    'log_file' => 'moodle_activity_generator.log'
];

// Modo de execução (cli ou web)
$is_cli = php_sapi_name() === 'cli';

if ($is_cli) {
    // Modo CLI - verifica argumentos
    $options = getopt('f', ['foreground']);
    $run_foreground = isset($options['f']) || isset($options['foreground']);
    
    if (!$run_foreground) {
        // Daemon simples para segundo plano
        $pid = pcntl_fork();
        if ($pid == -1) {
            die("Erro ao criar processo filho\n");
        } elseif ($pid) {
            // Processo pai
            echo "Gerador de atividades iniciado em segundo plano (PID: $pid)\n";
            echo "Logs em: {$config['log_file']}\n";
            exit(0);
        }
        // Processo filho continua
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
