<?php

require_once '../models/Mascotas.php';

if(isset($_POST['operacion'])){
  $mascotas = new Mascota();

  
  if($_POST['operacion'] == 'Registrar'){
    $datos = [
      "idcliente" => $_POST['idcliente'],
      "idraza" => $_POST['idraza'],
      "nombre" => $_POST['nombre'],
      "fotografia" => $_POST['fotografia'],
      "color" => $_POST['color'],
      "genero" => $_POST['genero']
    ];
    $respuesta = $mascotas->RegistrarMascota($datos);
    echo json_encode($respuesta);
  }
}