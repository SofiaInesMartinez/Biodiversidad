<?php

class AuthHelper
{
    public function __construct()
    {
    }

    public function login($user)
    {
        session_start();
        $_SESSION['NOMBRE'] = $user->nombre;
        $_SESSION['ROL'] = $user->rol;
        $_SESSION['ID'] = $user->id_usuario;
        $_SESSION['MAIL'] = $user->mail;
        header("Location: " . BASE_URL . "home");
    }

    function logout()
    {
        session_start();
        session_destroy();
        header("Location: " . BASE_URL . "home");
    }

    function checkRol()
    {
        session_start();
        if (!isset($_SESSION['ROL'])||$_SESSION['ROL']!='adm') {
            header("Location: " . BASE_URL . "login");
            die();
        }
    }

    function checkClearence()
    {
        session_start();
        if (isset($_SESSION['ID'])&&isset($_SESSION['ROL'])) {
            $id = $_SESSION['ID'];
            $rol = $_SESSION['ROL'];
        } else {
            $id = "";
            $rol="";
        }
        $user = array(
            "id"=>$id,
            "rol"=>$rol
        );
        return $user;
    }
}
