<?php
require_once 'controllers/EmailController.php';
require_once 'controllers/NotificacaoController.php';
require_once "conexao/DataBaseConnect.php";
require_once "models/MoodleDataFetcher.php";
require_once "models/NotificationManager.php";
require_once "models/NotificationSender.php";
require_once ".." . '/vendor/autoload.php';


use Controller\EmailController;
use Controller\NotificacaoController;
use Dotenv\Dotenv;

$dotenv = Dotenv::createImmutable('../');
$dotenv->load();

$notificacao = new NotificacaoController();

$notificacao->index();





