<?php

require_once 'Conexion.php';

Class Clientes extends Conexion{

  private $conexion;

  public function __CONSTRUCT(){
    $this->conexion = parent::getConexion();
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

  public function RegistrarClientes($datos = []){
    $respuesta = [
      "status" => false,
      "message" => ""
    ];
    try {
      $consulta = $this->conexion->prepare("CALL spu_clientes_registrar(?,?,?,?)");
      $respuesta["status"] = $consulta->execute(array(
        $datos["apellidos"],
        $datos["nombres"],
        $datos["dni"],
        $datos["claveacceso"]
      ));
    }
    catch(Exception $e){
      $respuesta["message"] = "no se pudo completar la operacion" .$e->getCode();

    }
    return $respuesta;
  }
}