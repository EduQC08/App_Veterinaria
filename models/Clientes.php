<?php

require_once 'Conexion.php';

Class Clientes extends Conexion{

  private $acceso;

  public function __CONSTRUCT(){
    $this->conexion = parent::getConnect();
  }

  public function BuscarClientes($dni = 0){
    try{
      $consulta = $this->conexion->prepare("CALL spu_clientes_buscar(?)");
      $consulta->execute(array($dni));
      return $consulta->fetchAll(PDO::FETCH_ASSOC);
    }
    catch(Exception $e){
      die($e->getMessage());
    }
  }
}