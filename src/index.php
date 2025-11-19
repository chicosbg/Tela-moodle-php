<?php
require_once "conexao/DataBaseConnect.php";
require_once "models/MoodleDataFetcher.php";
require_once "models/NotificationManager.php";
require_once ".." . '/vendor/autoload.php';

use Conexao\DataBaseConnect;
use Models\MoodleDataFetcher;
use Models\NotificationManager;
use Dotenv\Dotenv;

$dotenv = Dotenv::createImmutable('../');
$dotenv->load();


// Inicialização
try {
    $conn = new DataBaseConnect();
    $dataFetcher = new MoodleDataFetcher($conn);
    $notificationManager = new NotificationManager($conn);
    
    // Buscar dados
    $atividades = $dataFetcher->getAtividadesPendentes();
    $estatisticas = $dataFetcher->getEstatisticas($atividades);
    $eventos = $dataFetcher->getProximosEventos();
    
    // Buscar notificações
    $notificacoes = $notificationManager->getRecentNotifications(10);
    $notificacoes_nao_lidas = $notificationManager->countUnread();
    
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
    $notificacoes = [];
    $notificacoes_nao_lidas = 0;
}

// Carregar views

include "views/header.php";
include "views/stats-cards.php";
include "views/atividades-lista.php";
include "views/footer.php";


