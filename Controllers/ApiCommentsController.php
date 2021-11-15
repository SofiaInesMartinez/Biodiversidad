<?php
require_once './Models/CommentsModel.php';
require_once './Views/APIView.php';

class ApiCommentsController
{
    private $view;
    private $model;
    private $data;

    public function __construct()
    {
        $this->view = new APIView();
        $this->model = new CommentsModel();
        $this->data = file_get_contents("php://input");
    }

    function getData()
    {
        return json_decode($this->data);
    }

    public function getComments()
    {
        $id_PN = $_POST["id_PN"];
        $comments = $this->model->getComments();
        return $this->view->response($comments, 200);
    }

    public function addComment($params = null)
    {
        $data = $this->getData();
        if (isset($data->comment) && isset($data->score)) { //Controlo que existan los datos que no pueden faltar ni pueden ser null
            $id =  $this->model->addComment($data->comment, $data->score, $data->id_usuario, $data->id_PN);
            $comment = $this->model->getComment($id);
            if ($comment) {
                $this->view->response($comment, 200);
            } else
                $this->view->response("El comentario no fue cread0", 500);
        } else
            return $this->view->response("Faltan datos para crear el comentario", 200);
    }

    

    public function getComment($params = null)
    {
        $id = $params[':ID'];
        $comment = $this->model->getComment($id);
        if ($comment)
            return $this->view->response($comment, 200);
        else
            return $this->view->response("El comentario id=$id no existe", 200);
    }

    public function updateComment($params = null)
    {
        $id = $params[':ID'];
        $comment = $this->model->getComment($id);

        if ($comment) {
            $data = $this->getData();
            if (isset($data->comment) && isset($data->score)) {
                $comment = $this->model->updateComment($id, $data->comment, $data->score, $data->user);
                return $this->view->response("Comentario id=$id actualizado con éxito", 200);
            } else
                return $this->view->response("Faltan datos para actualizar comentario id=$id", 200);
        } else
            return $this->view->response("El comentario id= $id no existe", 200);
    }


    public function deleteComment($params = null)
    {
        $id = $params[':ID'];
        $comment = $this->model->getComment($id);
        if ($comment) {
            $comment = $this->model->deleteComment($id);
            return $this->view->response("Comentario id=$id eliminado con éxito", 200);
        } else
            return $this->view->response("El comentario id= $id no existe", 200);
    }
}
