<?php
require_once __DIR__ . '/../vendor/autoload.php';

// ATIVAR DISPLAY DE ERROS - REMOVA DEPOIS
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

// Carregar variáveis de ambiente PRIMEIRO
use Dotenv\Dotenv;
$dotenv = Dotenv::createImmutable('../');
$dotenv->load();

require_once "conexao/DataBaseConnect.php";
require_once "models/NotificationManager.php";

use Conexao\DataBaseConnect;
use Models\NotificationManager;

try {
    $conn = new DataBaseConnect();
    $notificationManager = new NotificationManager($conn);
    
    $notificationManager->markAllAsRead();
    header('Location: index.php?refresh=' . time());
    exit;
    
} catch (Exception $e) {
    die("Erro ao marcar notificações como lidas: " . $e->getMessage());
}