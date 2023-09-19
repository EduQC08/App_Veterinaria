<?php

require_once 'Conexion.php';

class Usuarios extends Conexion{
  private $connection;

  public function __CONSTRUCT(){
    $this->connection = parent::getConnect();
  }

  public function login($dni = 0){
    try{
      $query = $this->connection->prepare("");
      $query->execute(array($dni));

      return $query->fetch(PDO::FETCH_ASSOC);
    }
    catch(Exception $err){
      die($err->getMessage());
    }
  }
}