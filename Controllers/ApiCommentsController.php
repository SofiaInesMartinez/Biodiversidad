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

    public function getData()
    {
        return json_decode($this->data);
    }

    public function getComments($params = null)
    {
        $id_PN = $params[':ID_PN'];
        $comments = $this->model->getCommentsbyArea($id_PN);
        return $this->view->response($comments, 200);
    }

    public function addComment($params = null)
    {
        $data = $this->getData();
        if (isset($data->comment) && isset($data->score) && isset($data->id_usuario) && isset($data->id_PN)) {
            $score = intval($data->score);
            $id_usuario = intval($data->id_usuario);
            $id_PN = intval($data->id_PN);
            $id = $this->model->addComment($data->comment, $score, $id_PN, $id_usuario);
            $comment = $this->model->getComment($id);
            if ($comment) {
                $this->view->response($comment, 200);
            } else
                $this->view->response("El comentario no fue creado", 500);
        } else
            return $this->view->response("Faltan datos para crear el comentario", 200);
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
