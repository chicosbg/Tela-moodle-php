<?php
require_once "conexao/DataBaseConnect.php";
require_once "../ActivityGenerator/MoodleActivityGenerator.php";
require_once "models/MoodleDataFetcher.php";

use Conexao\DataBaseConnect;
use Models\MoodleDataFetcher;

// Inicialização
try {
    $conn = new DataBaseConnect();
    $dataFetcher = new MoodleDataFetcher($conn);
    
    // Buscar dados
    $atividades = $dataFetcher->getAtividadesPendentes();
    $estatisticas = $dataFetcher->getEstatisticas($atividades);
    $eventos = $dataFetcher->getProximosEventos();
    
} catch (Exception $e) {
    $error = "Erro: " . $e->getMessage();
    $atividades = [];
    $estatisticas = [
        'total_pendentes' => 0,
        'entregas_7_dias' => 0,
        'notificacoes_hoje' => 0,
        'cursos_ativos' => 0
    ];
    $eventos = [];
}

// Carregar views
include "views/header.php";
include "views/stats-cards.php";
include "views/atividades-lista.php";
include "views/eventos-lista.php";
include "views/footer.php";
