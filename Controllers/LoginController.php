<?php
require_once './Models/UsersModel.php';
require_once './Views/LoginView.php';
require_once './Helpers/AuthHelper.php';

class LoginController
{
    private $model;
    private $view;
    private $authHelper;

    public function __construct() {
        $this->model = new UsersModel();
        $this->view = new LoginView();
        $this->authHelper = new AuthHelper();
    }

    function showLogin() {
        $this->view->showLogin("");
    }

    function showSignup() {
        $this->view->showSignup("");
    }

    function addUser() {
        $name = $_POST['nombre'];
        $mail = $_POST['mail'];
        $pass = $_POST['contrasena'];
        $user = $this->model->getUser($mail);
        if (($user == NULL)&&(isset($name)&&isset($mail)&&isset($pass))) {
            $hash = password_hash($pass, PASSWORD_DEFAULT);
            $this->model->addUser($name, $mail, $hash);
            $this->view->showSignup("Se registro al usuario exitosamente.");
        } else {
            $this->view->showSignup("Ocurrió un error en el registro.");
        }
    }

    function verifyUser() {
        $mail = $_POST['mail'];
        $pass = $_POST['contrasena'];
        $user = $this->model->getUser($mail);
        if ($user != NULL) {
            $hash = $user->clave;
            if (password_verify($pass, $hash)) {
                $this->authHelper->login($user);
            } else {
                $this->view->showLogin("Ocurrió un error en el ingreso.");
            }
        } else {
            $this->view->showLogin("Ocurrió un error en el ingreso.");
        }
    }

    function logout() {
        $this->authHelper->logout();
    }
}
