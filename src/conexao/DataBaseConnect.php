<?php 

namespace Conexao;

use PDO;
use PDOException;

class DataBaseConnect {
    private $dbname = 'moodle'; 
    private $username; 
    private $password; 
    private $host; 
    public $pdo;

    public function __construct() {
        try {
            $this->setEnviroment();
            $dsn = "mysql:host=" . $this->host . ";dbname=" . $this->dbname . ";charset=utf8mb4";
            $this->pdo = new PDO($dsn, $this->username, $this->password);
            $this->pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            $this->pdo->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
        } catch (PDOException $e) {
            die("Erro de conexão: " . $e->getMessage());
        }
    }    
    private function setEnviroment() {
        $this->host = $_ENV['DB_HOST'] . ':' . $_ENV['DB_PORT'];
        $this->username = $_ENV['DB_USER'];
        $this->password = $_ENV['DB_PASSWORD'];
    }
}
