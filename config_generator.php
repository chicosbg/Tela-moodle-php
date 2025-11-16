<?php
// Arquivo de configuração para o gerador de atividades

return [
    'database' => [
        'host' => 'localhost:3306',
        'dbname' => 'moodle',
        'username' => 'moodle_user',
        'password' => ''
    ],
    'generator' => [
        'tempo_espera' => 30,           // Segundos entre atividades
        'max_atividades' => 50,         // Máximo de atividades
        'curso_padrao' => 2,            // ID do curso
        'log_file' => 'activity_generator.log',
        'tipos_ativos' => ['assign', 'quiz'] // Tipos de atividades a gerar
    ]
];
