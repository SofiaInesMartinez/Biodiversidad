<?php

class AuthHelper {
    public function __construct() {}

    public function login($user) {
        session_start();
        $_SESSION['NOMBRE'] = $user->nombre;
        header("Location: " . BASE_URL . "home");
    }

    function logout() {
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

    function checkUser()
    {
        session_start();
        if (isset($_SESSION['NOMBRE'])) {
            $adm = $_SESSION['NOMBRE'];
        } else {
            $adm = '';
        }
        return $adm;
    }
}
