<?php

require_once '../models/Clientes.php';

if(isset($_POST['operacion'])){
  $clientes = new Clientes();

  if($_POST['operacion'] == 'Buscar'){
    $data = $clientes->BuscarClientes($_POST['dni']);
    echo json_encode($data);
  }
  
  if($_POST['operacion'] == 'Registrar'){
    $datos = [
      "apellidos" => $_POST['apellidos'],
      "nombres" => $_POST['nombres'],
      "dni" => $_POST['dni'],
      "claveacceso" => $_POST['claveacceso']
    ];
    $respuesta = $clientes->RegistrarClientes($datos);
    echo json_encode($respuesta);
  }
}