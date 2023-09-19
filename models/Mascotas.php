<?php

require_once 'Conexion.php';

class Mascota extends Conexion{
  private $connection;

  public function __CONSTRUCT(){
    $this->connection = parent::getConexion();
  }

  public function registrarMascota($data = []){
    $respuesta = [
      "status"  => false,
      "message" => ""
    ];
    try{
      $query = $this->connection->prepare("CALL spu_mascotas_registrar(?,?,?,?,?,?)");
      $respuesta["status"] = $query->execute(
        array(
          $data['idcliente'],
          $data['idraza'],
          $data['nombre'],
          $data['fotografia'],
          $data['color'],
          $data['genero']
        ));
      }catch(Exception $e){
        $respuesta["message"] = "No se pudo completar la operación Código error: " .$e->getCode();
      }
      return $respuesta;
    }
<<<<<<< HEAD
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
=======
  }
>>>>>>> b831066d2bacffad7e6ace3aef7bf1fb4a5f12a0
