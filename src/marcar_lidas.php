<?php
require_once "conexao/DataBaseConnect.php";
require_once "models/NotificationManager.php";

use Conexao\DataBaseConnect;
use Models\NotificationManager;

try {
    $conn = new DataBaseConnect();
    $notificationManager = new NotificationManager($conn);
    
    // Marcar todas como lidas
    // $notificationManager->markAllAsRead();
    
    // Redirecionar de volta ao dashboard
    header('Location: index.php');
    exit;
    
} catch (Exception $e) {
    die("Erro ao marcar notificações como lidas: " . $e->getMessage());
}
