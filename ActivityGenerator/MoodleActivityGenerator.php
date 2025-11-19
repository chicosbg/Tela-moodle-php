<?php

namespace ActivityGenerator;

use Conexao\DataBaseConnect;

class MoodleActivityGenerator {
    private $pdo;
    private $activities_created = 0;
    private $config;
    
    public function __construct(DataBaseConnect $dbConnect, $config = []) {
        $this->pdo = $dbConnect->pdo;
        $this->config = array_merge([
            'tempo_espera' => 30,
            'max_atividades' => 50,
            'log_file' => 'moodle_activity_generator.log'
        ], $config);
    }
    
    public function run() {
        $this->log("Iniciando gerador de atividades do Moodle...");
        $this->log("Configuração: {$this->config['tempo_espera']}s entre atividades, máximo: {$this->config['max_atividades']}");
        
        $this->createCourse();

        while ($this->activities_created < $this->config['max_atividades']) {
            try {
                // Escolhe aleatoriamente entre criar tarefa ou questionário
                $activity_type = rand(0, 1) ? 'assign' : 'quiz';
                
                
                if ($activity_type === 'assign') {
                    $activity_id = $this->createAssignment();
                } else {
                    $activity_id = $this->createQuiz();
                }
                
                $this->activities_created++;
                
                $this->log("Atividade #{$this->activities_created} criada (ID: {$activity_id}, Tipo: {$activity_type})");
                
                // Aguarda o tempo configurado
                if ($this->activities_created < $this->config['max_atividades']) {
                    sleep($this->config['tempo_espera']);
                }
                
            } catch (\Exception $e) {
                $this->log("Erro ao criar atividade: " . $e->getMessage());
                sleep($this->config['tempo_espera']); // Aguarda mesmo em caso de erro
            }
        }
        
        $this->log("Processo concluído! {$this->activities_created} atividades criadas.");
    }
    
    private function createAssignment() {
        $tipos_tarefa = [
            [
                'nome' => 'Trabalho Prático - ' . $this->generateRandomName(),
                'descricao' => 'Desenvolva uma solução prática para o problema proposto.',
                'dias_vencimento' => rand(7, 30)
            ],
            [
                'nome' => 'Relatório Técnico - ' . $this->generateRandomName(),
                'descricao' => 'Elabore um relatório detalhado sobre o tema estudado.',
                'dias_vencimento' => rand(10, 21)
            ],
            [
                'nome' => 'Projeto em Grupo - ' . $this->generateRandomName(),
                'descricao' => 'Trabalho colaborativo para desenvolvimento de projeto.',
                'dias_vencimento' => rand(14, 35)
            ],
            [
                'nome' => 'Análise de Caso - ' . $this->generateRandomName(),
                'descricao' => 'Analise o caso apresentado e apresente suas conclusões.',
                'dias_vencimento' => rand(5, 15)
            ]
        ];
        
        $tarefa = $tipos_tarefa[array_rand($tipos_tarefa)];
        $timestamp = time();
        $duedate = $timestamp + ($tarefa['dias_vencimento'] * 24 * 60 * 60);
        
        $sql = "INSERT INTO mdl_assign (
                    course, name, intro, introformat, alwaysshowdescription,
                    nosubmissions, submissiondrafts, sendnotifications,
                    sendlatenotifications, duedate, allowsubmissionsfromdate,
                    grade, timemodified, requiresubmissionstatement,
                    completionsubmit, cutoffdate, gradingduedate,
                    teamsubmission, requireallteammemberssubmit,
                    teamsubmissiongroupingid, blindmarking, hidegrader,
                    revealidentities, attemptreopenmethod, maxattempts,
                    markingworkflow, markingallocation, sendstudentnotifications
                ) VALUES (
                    :course, :name, :intro, :introformat, :alwaysshowdescription,
                    :nosubmissions, :submissiondrafts, :sendnotifications,
                    :sendlatenotifications, :duedate, :allowsubmissionsfromdate,
                    :grade, :timemodified, :requiresubmissionstatement,
                    :completionsubmit, :cutoffdate, :gradingduedate,
                    :teamsubmission, :requireallteammemberssubmit,
                    :teamsubmissiongroupingid, :blindmarking, :hidegrader,
                    :revealidentities, :attemptreopenmethod, :maxattempts,
                    :markingworkflow, :markingallocation, :sendstudentnotifications
                )";
        
        $stmt = $this->pdo->prepare($sql);
        $stmt->execute([
            ':course' => random_int(1,2),
            ':name' => $tarefa['nome'],
            ':intro' => $tarefa['descricao'],
            ':introformat' => 1,
            ':alwaysshowdescription' => 1,
            ':nosubmissions' => 0,
            ':submissiondrafts' => rand(0, 1),
            ':sendnotifications' => 1,
            ':sendlatenotifications' => 0,
            ':duedate' => $duedate,
            ':allowsubmissionsfromdate' => $timestamp,
            ':grade' => 100,
            ':timemodified' => $timestamp,
            ':requiresubmissionstatement' => rand(0, 1),
            ':completionsubmit' => 1,
            ':cutoffdate' => $duedate + (7 * 24 * 60 * 60),
            ':gradingduedate' => $duedate + (3 * 24 * 60 * 60),
            ':teamsubmission' => strpos($tarefa['nome'], 'Grupo') !== false ? 1 : 0,
            ':requireallteammemberssubmit' => 0,
            ':teamsubmissiongroupingid' => 0,
            ':blindmarking' => 0,
            ':hidegrader' => 0,
            ':revealidentities' => 0,
            ':attemptreopenmethod' => 'none',
            ':maxattempts' => -1,
            ':markingworkflow' => 0,
            ':markingallocation' => 0,
            ':sendstudentnotifications' => 1
        ]);
        
        return $this->pdo->lastInsertId();
    }


    private function createCourse() {
        $cursos = [[":id"=>1, ":fullname"=>"Metodologia cientifica",":shortname"=>"MC"], [":id"=>2, ":fullname"=>"Engenharia de Software", ":shortname"=>"ES"]];
        foreach ($cursos as $curso) {
            $sql = "INSERT INTO mdl_course (id, fullname, shortname, visible)
                VALUES (:id, :fullname, :shortname, 1)
                ON DUPLICATE KEY UPDATE
                    fullname = VALUES(fullname),
                    visible = VALUES(visible);";

            $stmt = $this->pdo->prepare($sql)->execute($curso);
        }
    }
    
    private function createQuiz() {
        $tipos_quiz = [
            [
                'nome' => 'Quiz de Verificação - ' . $this->generateRandomName(),
                'descricao' => 'Teste seus conhecimentos sobre o conteúdo estudado.',
                'duracao' => rand(30, 60) // minutos
            ],
            [
                'nome' => 'Avaliação Parcial - ' . $this->generateRandomName(),
                'descricao' => 'Avaliação parcial do módulo atual.',
                'duracao' => rand(45, 90)
            ],
            [
                'nome' => 'Exercício Rápido - ' . $this->generateRandomName(),
                'descricao' => 'Exercício rápido para fixação do conteúdo.',
                'duracao' => rand(15, 30)
            ]
        ];
        
        $quiz = $tipos_quiz[array_rand($tipos_quiz)];
        $timestamp = time();
        $timeopen = $timestamp;
        $timeclose = $timestamp + (rand(7, 21) * 24 * 60 * 60); // 7-21 dias para fechar
        
        $sql = "INSERT INTO mdl_quiz (
                    course, name, intro, introformat, timeopen, timeclose,
                    timelimit, overduehandling, graceperiod, preferredbehaviour,
                    canredoquestions, attempts, attemptonlast, grademethod,
                    decimalpoints, questiondecimalpoints, reviewattempt,
                    reviewcorrectness, reviewmaxmarks, reviewmarks,
                    reviewspecificfeedback, reviewgeneralfeedback,
                    reviewrightanswer, reviewoverallfeedback, questionsperpage,
                    navmethod, shuffleanswers, sumgrades, grade, timecreated,
                    timemodified, password, subnet, browsersecurity, delay1,
                    delay2, showuserpicture, showblocks
                ) VALUES (
                    :course, :name, :intro, :introformat, :timeopen, :timeclose,
                    :timelimit, :overduehandling, :graceperiod, :preferredbehaviour,
                    :canredoquestions, :attempts, :attemptonlast, :grademethod,
                    :decimalpoints, :questiondecimalpoints, :reviewattempt,
                    :reviewcorrectness, :reviewmaxmarks, :reviewmarks,
                    :reviewspecificfeedback, :reviewgeneralfeedback,
                    :reviewrightanswer, :reviewoverallfeedback, :questionsperpage,
                    :navmethod, :shuffleanswers, :sumgrades, :grade, :timecreated,
                    :timemodified, :password, :subnet, :browsersecurity, :delay1,
                    :delay2, :showuserpicture, :showblocks
                )";
        
        $stmt = $this->pdo->prepare($sql);
        $stmt->execute([
            ':course' => $this->config['curso_padrao'],
            ':name' => $quiz['nome'],
            ':intro' => $quiz['descricao'],
            ':introformat' => 1,
            ':timeopen' => $timeopen,
            ':timeclose' => $timeclose,
            ':timelimit' => $quiz['duracao'] * 60, // converter para segundos
            ':overduehandling' => 'autoabandon',
            ':graceperiod' => 300,
            ':preferredbehaviour' => 'deferredfeedback',
            ':canredoquestions' => 0,
            ':attempts' => rand(1, 3),
            ':attemptonlast' => 0,
            ':grademethod' => 1,
            ':decimalpoints' => 2,
            ':questiondecimalpoints' => -1,
            ':reviewattempt' => 69888,
            ':reviewcorrectness' => 4352,
            ':reviewmaxmarks' => 4352,
            ':reviewmarks' => 4352,
            ':reviewspecificfeedback' => 4352,
            ':reviewgeneralfeedback' => 4352,
            ':reviewrightanswer' => 4352,
            ':reviewoverallfeedback' => 4352,
            ':questionsperpage' => 1,
            ':navmethod' => 'free',
            ':shuffleanswers' => 1,
            ':sumgrades' => 10,
            ':grade' => 10,
            ':timecreated' => $timestamp,
            ':timemodified' => $timestamp,
            ':password' => '',
            ':subnet' => '',
            ':browsersecurity' => '-',
            ':delay1' => 0,
            ':delay2' => 0,
            ':showuserpicture' => 0,
            ':showblocks' => 0
        ]);
        
        return $this->pdo->lastInsertId();
    }
    
    private function generateRandomName() {
        $adjetivos = ['Fundamental', 'Avançado', 'Intermediário', 'Básico', 'Complexo', 'Simples', 'Prático', 'Teórico'];
        $topicos = ['Programação', 'Banco de Dados', 'Redes', 'Segurança', 'Design', 'Matemática', 'Estatística', 'Lógica'];
        $sufixos = ['2024', 'Módulo II', 'Unidade 3', 'Parte A', 'Versão Final'];
        
        return $adjetivos[array_rand($adjetivos)] . ' - ' . 
               $topicos[array_rand($topicos)] . ' - ' . 
               $sufixos[array_rand($sufixos)];
    }
    
    private function log($message) {
        $timestamp = date('Y-m-d H:i:s');
        $log_message = "[{$timestamp}] {$message}\n";
        
        // Log para arquivo
        file_put_contents($this->config['log_file'], $log_message, FILE_APPEND | LOCK_EX);
        
        // Se estiver no CLI, também mostra no console
        if (php_sapi_name() === 'cli') {
            echo $log_message;
        }
    }
    
    public function getStats() {
        return [
            'activities_created' => $this->activities_created,
            'config' => $this->config
        ];
    }
}
