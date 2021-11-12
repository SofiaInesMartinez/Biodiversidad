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
        header("Location: " . BASE_URL . "home");
    }

    function logout()
    {
        session_start();
        session_destroy();
        header("Location: " . BASE_URL . "home");
    }

    function checkLoggedIn()
    {
        session_start();
        if (!isset($_SESSION['NOMBRE'])) {
            header("Location: " . BASE_URL . "login");
            die();
        }
    }

    function checkCredentials()
    {
        session_start();
        if (isset($_SESSION['ROL'])) {
            $rol = $_SESSION['ROL'];
            return $rol;
        }
    }
}
