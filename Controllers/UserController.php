<?php
require_once './Models/UsersModel.php';
require_once './Views/UsersView.php';
require_once './Helpers/AuthHelper.php';

class UserController
{
    private $model;
    private $view;
    private $authHelper;

    public function __construct()
    {
        $this->model = new UsersModel();
        $this->view = new UsersView();
        $this->authHelper = new AuthHelper();
    }

    function showLogin()
    {
        $this->view->showLogin("");
    }

    function showSignup()
    {
        $this->view->showSignup("");
    }

    function addUser()
    {
        if (isset($_POST['nombre']) && $_POST['nombre'] != '' && isset($_POST['mail']) && $_POST['mail'] != '' && isset($_POST['contrasena']) && $_POST['contrasena'] != '') {
            $name = $_POST['nombre'];
            $mail = $_POST['mail'];
            $pass = $_POST['contrasena'];
            $user = $this->model->getUserByMail($mail);
            if (!$user) {
                $hash = password_hash($pass, PASSWORD_DEFAULT);
                $this->model->addUser($name, $mail, $hash);
                $user = $this->model->getUserByMail($mail);
                $this->authHelper->login($user);
            } else {
                $this->view->showSignup("El usuario ya existe.");
            }
        } else
            $this->view->showSignup("Por favor, complete todos los campos.");
    }

    function verifyUser()
    {
        if (isset($_POST['mail']) && $_POST['mail'] != '' && isset($_POST['contrasena']) && $_POST['contrasena'] != '') {
            $mail = $_POST['mail'];
            $pass = $_POST['contrasena'];
            $user = $this->model->getUserByMail($mail);
            if ($user != NULL) {
                $hash = $user->clave;
                if (password_verify($pass, $hash))
                    $this->authHelper->login($user);
                else
                    $this->view->showLogin("Ocurrió un error en el ingreso.");
            } else
                $this->view->showLogin("Ocurrió un error en el ingreso.");
        } else
            $this->view->showSignup("Por favor, complete todos los campos.");
    }

    function showUsers()
    {
        $this->authHelper->checkLoggedIn();
        if ($_SESSION['ROL'] == 'adm') {
            $this->view->showUsers();
        } else {
            $this->view->showLogin("Necesita permiso de administrador.");
        }
    }

    function logout()
    {
        $this->authHelper->logout();
    }
}
