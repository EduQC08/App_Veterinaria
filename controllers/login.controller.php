<?php

session_start();

require_once '../models/Login.php';

if(isset($_GET['op'])){
  $login = new Usuarios();

  if($_GET['op'] == 'destroy'){
    session_destroy();
    session_unset();
    header('Location:../');
  }

  if($_GET['op'] == 'login'){
    $acceso = [
      "login"       => false,
      "nombres"     => "",
      "apellidos"   => "",
      "dni"         => "",
      "mensaje"     => ""
    ];
    $data = $login->login($_GET['dni']);
    $keyIngresada = $_GET['claveacceso'];

    if($data){
      if(password_verify($keyIngresada, $data['claveacceso'])){
        $acceso["login"] = true;
        $acceso["nombres"] = $data["nombres"];
        $acceso["apellidos"] = $data["apellidos"];
        $acceso["dni"]  = $data["dni"];
        $acceso["idcliente"] = $data["idcliente"];
      }else{
        $acceso["mensaje"] = "contraseña";
      }
    }else{
      $acceso["mensaje"] = "Usuario";
    }

    $_SESSION['segurity'] = $acceso;

    echo json_encode($acceso);
  }
}
?>