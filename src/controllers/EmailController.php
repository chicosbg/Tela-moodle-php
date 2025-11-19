<?php 
require_once "../../vendor/autoload.php";

use PHPMailer\PHPMailer\PHPMailer;


class EmailController {
    private $mail;

    public function __construct() {}

    public function Enviar($email, $subject, $body) {
        $this->config_email();

        $this->mail->addAddress($email);

        $this->mail->isHTML(true);
        
        $this->mail->Subject = $subject;
        $this->mail->Body = $body;

        $this->mail->send();
    }

    private function config_email() {
        $this->mail = new PHPMailer(true);

        $this->mail->isSMTP();

        $this->mail->Host = "localhost";
        
        $this->mail->SMTPAuth = true; 

        $this->mail->Username = $_ENV["MAIL_EMAIL"]; 
        $this->mail->Password = $_ENV["MAIL_PASSWORD"]; 

        $this->mail->SMTPOptions = array( 'ssl' => array( 'verify_peer' => false, 'verify_peer_name' => false, 'allow_self_signed' => true ) ); 

        $this->mail->From = $_ENV["MAIL_EMAIL"]; 
        $this->mail->FromName = $_ENV["MAIL_NAME"];
    }

}