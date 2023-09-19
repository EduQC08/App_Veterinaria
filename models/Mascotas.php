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


    public function RegistrarMascota($data = []){

      $respuesta = [
        "status" => false,
        "message" => ""
      ];

      try{
        $consulta = $this->connection->prepare("CALL spu_mascotas_registrar(?,?,?,?,?,?)");
        $respuesta["status"] = $consulta->execute(array(
          $data["idcliente"],
          $data["idraza"],
          $data["nombre"],
          $data["fotografia"],
          $data["color"],
          $data["genero"],
        ));
      }
      catch(Exception $e){
        $respuesta["message"] = "No se pudo completar la operacion";
      }
      return $respuesta;
    }
}