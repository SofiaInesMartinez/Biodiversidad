<?php

class CommentsModel
{

    private $db;

    public function __construct()
    {
        $this->db = new PDO('mysql:host=localhost;' . 'dbname=biodiversidad;charset=utf8', 'root', '');
    }

    public function getCommentsbyArea($id_PN)
    {
        $query = $this->db->prepare("SELECT a.*, b.nombre FROM comentario a LEFT JOIN usuario b
        ON a.id_usuario = b.id_usuario WHERE id_PN = ?");
        $query->execute([$id_PN]);
        $comments = $query->fetchAll(PDO::FETCH_OBJ);
        return $comments;
    }

    public function getCommentsbyScore($id_PN, $score)
    {
        $query = $this->db->prepare("SELECT a.*, b.nombre FROM comentario a LEFT JOIN usuario b
        ON a.id_usuario = b.id_usuario WHERE id_PN = ? AND score = ?");
        $query->execute([$id_PN, $score]);
        $comments = $query->fetchAll(PDO::FETCH_OBJ);
        return $comments;
    }

    public function addComment($comment, $score, $id_PN, $user)
    {
        $query = $this->db->prepare("INSERT INTO comentario(comment, score, id_PN, id_usuario) VALUES(?,?,?,?)");
        $query->execute([$comment, $score, $id_PN, $user]);
        return $this->db->lastInsertId();
    }

    public function getComment($id)
    {
        $query = $this->db->prepare('SELECT * FROM comentario WHERE id_comment = ?');
        $query->execute([$id]);
        $comment = $query->fetch(PDO::FETCH_OBJ);
        return $comment;
    }

    public function deleteComment($id)
    {
        $query = $this->db->prepare('DELETE FROM comentario WHERE id_comment = ?');
        $query->execute([$id]);
    }

    public function deleteCommentsByUser($user_id)
    {
        $query = $this->db->prepare('DELETE FROM comentario WHERE id_usuario = ?');
        $query->execute([$user_id]);
    }

    public function deleteCommentsByArea($id_PN)
    {
        $query = $this->db->prepare('DELETE FROM comentario WHERE id_PN = ?');
        $query->execute([$id_PN]);
    }
}
