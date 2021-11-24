<?php
require_once './Models/UsersModel.php';
require_once './Models/CommentsModel.php';
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
        $this->commentsModel = new CommentsModel();
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

    function showUsers()
    {
        $this->authHelper->checkRol();
        $users = $this->model->getUsers();
        $this->view->showUsers($users);
    }

    public function updateUserRol()
    {
        $this->authHelper->checkRol();
        if (isset($_POST['id']) && isset($_POST['rol']) && ($_POST['id'] != '') && ($_POST['rol'] != '')) {
            $id = $_POST["id"];
            $rol = $_POST["rol"];
            $user = $this->model->getUserById($id);
            if ($user) {
                $this->model->updateUserRol($id, $rol);
                header("Location: " . BASE_URL . "usuarios");
            } else
                $this->view->renderError("El usuario id=$id no existe.");
        } else
            $this->view->renderError("El usuario no fue actualizado.");
    }

    public function deleteUser($id)
    {
        $this->authHelper->checkRol();
        if (isset($id) && $id != '') {
            $user = $this->model->getUserById($id);
            if ($user) {
                $this->commentsModel->deleteCommentsByUser($id);
                $this->model->deleteUser($id);
                header("Location: " . BASE_URL . "usuarios");
            } else
                $this->view->renderError("El usuario id=$id no existe.");
        } else
            $this->view->renderError("Falta especificar usuario.");
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

    function logout()
    {
        $this->authHelper->logout();
    }
}
