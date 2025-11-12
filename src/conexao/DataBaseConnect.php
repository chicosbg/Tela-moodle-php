<?php 

namespace Conexao;

use PDO;

class DataBaseConnect {
    private $host = 'localhost:3306'; 
    private $dbname = 'your_database_name'; 
    private $username = 'your_username'; 
    private $password = 'your_password'; 
    private $pdo;
    public function __construct() {
        $dsn = "mysql:host=" . $this->host . ";dbname=" . $this->dbname;
        $this->pdo = new PDO($dsn, $this->username, $this->password);
    }
    
    
}