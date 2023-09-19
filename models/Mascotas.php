<?php

require_once 'Conexion.php';

class Mascota extends Conexion{
  private $connection;

  public function __CONSTRUCT(){
    $this->connection = parent::getConexion();
  }

  public function listarMascota($data = []){
    try{
      $query = $this->connection->prepare("CALL");
      $query->execute(
        array(
          $data['idmascota']
        )
        );
        return $query->fetchAll(PDO::FETCH_ASSOC);
    }
    catch(Exception $e){
      die($e->getCode());
    }
  }
}