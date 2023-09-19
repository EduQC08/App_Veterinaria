<?php

require_once '../models/Clientes.php';

if(isset($_POST['operacion'])){
  $clientes = new Clientes();

  if($_POST['operacion'] == 'Buscar'){
    $data = $clientes->BuscarClientes($_POST['dni']);
    echo json_encode($data);
  }
}