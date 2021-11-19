<?php
require_once './Models/UsersModel.php';
require_once './Views/APIView.php';

class ApiUsersController
{
    private $view;
    private $model;
    private $data;

    public function __construct()
    {
        $this->view = new APIView();
        $this->model = new UsersModel();
        $this->data = file_get_contents("php://input");
    }

    public function getData()
    {
        return json_decode($this->data);
    }

    public function getUsers($params = null)
    {
        $users = $this->model->getUsers();
        return $this->view->response($users, 200);
    }

    public function updateUser($params = null) {
        $user_id = $params[':ID'];
        $user = $this->model->getUser($user_id);

        if ($user) {
            $body = $this->getData();
            $rol = $body->rol;
            $user = $this->model->updateUser($user_id, $rol);
            $this->view->response("User id=$user_id actualizado con éxito", 200);
        }
        else 
            $this->view->response("User id=$user_id not found", 404);
    }

    public function deleteUser($params = null) {
        $user_id = $params[':ID'];
        $user = $this->model->getUserByID($user_id);

        if ($user) {
            $this->model->deleteUser($user_id);
            $this->view->response("User id=$user_id eliminado con éxito", 200);
        }
        else 
            $this->view->response("User id=$user_id not found", 404);
    }
}
