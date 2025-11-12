<?php 
include "conexao/DataBaseConnect.php";

use Conexao\DataBaseConnect;



$conn = new DataBaseConnect();

$sql = "";

$stmt = $this->pdo->prepare($sql);