<?php
namespace Controller;


// require_once __DIR__ . '/../../vendor/autoload.php';


use PHPMailer\PHPMailer\PHPMailer;


class EmailController
{
    private $mail;

    public function __construct()
    {
    }

    public function enviar($email, $subject, $body)
    {
        // Configure only if mail object doesn't exist yet
        if (!$this->mail) {
            $this->config_email();
        }

        try {
            // clear addresses from previous sends (important if keeping connection alive)
            $this->mail->clearAddresses();

            $this->mail->addAddress($email);
            $this->mail->isHTML(true);

            $this->mail->Subject = $subject;
            $this->mail->Body = $body;

            // Reset CharSet to UTF-8 to avoid encoding issues
            $this->mail->CharSet = 'UTF-8';

            return $this->mail->send();

        } catch (Exception $e) {
            // Handle error or return false
            $e->getMessage();
            return false;
        }
    }

    private function config_email()
    {
        $this->mail = new PHPMailer(true);

        $this->mail->isSMTP();
        $this->mail->Host = "smtp.gmail.com";

        // CORRECT SETTINGS FOR GMAIL (SSL/465)
        $this->mail->SMTPAuth = true;
        $this->mail->SMTPSecure = PHPMailer::ENCRYPTION_SMTPS; // Uses 'ssl'
        $this->mail->Port = 465;

        $this->mail->Username = $_ENV["MAIL_EMAIL"];
        $this->mail->Password = $_ENV["MAIL_PASSWORD"];

        $this->mail->From = $_ENV["MAIL_EMAIL"];
        $this->mail->FromName = $_ENV["MAIL_NAME"];

        // Keep connection alive if you send multiple emails in a loop
        $this->mail->SMTPKeepAlive = true;
    }

}