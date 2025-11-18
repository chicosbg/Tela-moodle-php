<?php
require_once "conexao/DataBaseConnect.php";
require_once "models/UserPreferences.php";

use Conexao\DataBaseConnect;
use Models\UserPreferences;

// Processar atualização de preferências
$success = null;
$error = null;

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    try {
        $conn = new DataBaseConnect();
        $userPrefs = new UserPreferences($conn);
        
        $data = [
            'hours_before_deadline' => (int)$_POST['hours_before_deadline'],
            'silence_start_time' => $_POST['silence_start_time'],
            'silence_end_time' => $_POST['silence_end_time'],
            'notify_changes' => isset($_POST['notify_changes']) ? 1 : 0,
            'notify_deadlines' => isset($_POST['notify_deadlines']) ? 1 : 0
        ];
        
        if ($userPrefs->updatePreferences($data)) {
            $success = "Configurações salvas com sucesso!";
        } else {
            $error = "Erro ao salvar configurações.";
        }
    } catch (Exception $e) {
        $error = "Erro: " . $e->getMessage();
    }
}

// Buscar preferências atuais
try {
    $conn = new DataBaseConnect();
    $userPrefs = new UserPreferences($conn);
    $preferences = $userPrefs->getPreferences();
} catch (Exception $e) {
    $error = "Erro ao carregar preferências: " . $e->getMessage();
    $preferences = [
        'hours_before_deadline' => 24,
        'silence_start_time' => '22:00:00',
        'silence_end_time' => '08:00:00',
        'notify_changes' => 1,
        'notify_deadlines' => 1
    ];
}

// Carregar views
include "views/header.php";
include "views/configuracoes-form.php";
include "views/footer.php";
