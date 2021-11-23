<?php
require_once './Models/UsersModel.php';
require_once './Views/APIView.php';
require_once './Models/CommentsModel.php';

class ApiUsersController
{
    private $view;
    private $model;
    private $data;
    private $commentsModel;

    public function __construct()
    {
        $this->view = new APIView();
        $this->model = new UsersModel();
        $this->commentsModel = new CommentsModel();
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

    public function updateUser($params = null)
    {
        if (isset($params[':ID']) && $params[':ID'] != '') {
            $user_id = $params[':ID'];
            $user = $this->model->getUserByID($user_id);
            if ($user) {
                $body = $this->getData();
                $rol = $body->rol;
                $user = $this->model->updateUser($user_id, $rol);
                $this->view->response("User id=$user_id actualizado con éxito", 200);
            } else
                $this->view->response("User id=$user_id not found", 404);
        } else
            $this->view->response("Faltan datos", 200);
    }

    public function deleteUser($params = null)
    {
        if (isset($params[':ID']) && $params[':ID'] != '') {
            $user_id = $params[':ID'];
            $user = $this->model->getUserByID($user_id);
            if ($user) {
                $this->commentsModel->deleteCommentsByUser($user_id);
                $this->model->deleteUser($user_id);
                $this->view->response("User id=$user_id eliminado con éxito", 200);
            } else
                $this->view->response("User id=$user_id not found", 404);
        } else
            $this->view->response("Faltan datos", 200);
    }
}
