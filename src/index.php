<?php 
include "conexao/DataBaseConnect.php";

use Conexao\DataBaseConnect;



$conn = new DataBaseConnect();

$sql = 'SELECT @@version;';

$stmt = $conn->pdo->prepare($sql);

print_r($stmt->execute());

print_r($stmt->fetchAll(PDO::FETCH_ASSOC));