<?php 
namespace Controller;


use Models\NotificationSender;  
use Conexao\DataBaseConnect;


class NotificacaoController {

    public function index() {
        
        $notificaoSender = new NotificationSender(new DataBaseConnect());
        try {
            print_r($notificaoSender->processAllNotifications());
        } catch (\Exception $e) {
            echo $e->getMessage();
        }
    }



}