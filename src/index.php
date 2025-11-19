<?php
require_once "conexao/DataBaseConnect.php";
require_once "models/MoodleDataFetcher.php";
require_once "models/NotificationManager.php";
require_once "models/NotificationSender.php";
require_once ".." . '/vendor/autoload.php';
require_once 'controllers/EmailController.php';
require_once 'controllers/NotificacaoController.php';

use Conexao\DataBaseConnect;
use Models\MoodleDataFetcher;
use Models\NotificationManager;
use Dotenv\Dotenv;
use Controller\EmailController;
use Controller\NotificacaoController;

$dotenv = Dotenv::createImmutable('../');
$dotenv->load();

$notificacao = new NotificacaoController();
$notificacao->index();


// Inicialização
try {
    $conn = new DataBaseConnect();
    $dataFetcher = new MoodleDataFetcher($conn);
    $notificationManager = new NotificationManager($conn);
    
    // Buscar dados
    $atividades = $dataFetcher->getAtividadesPendentes();
    $estatisticas = $dataFetcher->getEstatisticas($atividades);
    
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
?>
<script>
// Executar quando a página carregar
document.addEventListener('DOMContentLoaded', function() {
    console.log('📡 Enviando requisição para notificacoes.php...');
    
    fetch('http://localhost:8000/notificacoes.php')
        .then(response => {
            if (response.ok) {
                console.log('✅ Notificações verificadas com sucesso');
            } else {
                console.log('⚠️ Erro na requisição:', response.status);
            }
        })
        .catch(error => {
            console.log('❌ Erro:', error);
        });
});
</script>
<?php
// Carregar views

include "views/header.php";
include "views/notificacoes-lista.php";
include "views/stats-cards.php";
include "views/atividades-lista.php";
include "views/footer.php";
?>

<meta http-equiv="refresh" content="10">

