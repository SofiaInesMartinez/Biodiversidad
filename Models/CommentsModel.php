<?php

class CommentsModel
{

    private $db;

    public function __construct()
    {
        $this->db = new PDO('mysql:host=localhost;' . 'dbname=biodiversidad;charset=utf8', 'root', '');
    }

    public function getComments()
    {
        $query = $this->db->prepare('SELECT * FROM comentario');
        $query->execute([]);
        $comments = $query->fetchAll(PDO::FETCH_OBJ);
        return $comments;
    }

    public function addComment($comment, $score, $id_PN, $user)
    {
        $query = $this->db->prepare('INSERT INTO comentario(comment, score, id_PN, id_usuario) VALUES(?,?,?,?)');
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

    public function updateComment($id, $comment, $score)
    {
        $query = $this->db->prepare('UPDATE comentario SET comment =?, score = ? WHERE id_comment = ?');
        $query->execute([$comment, $score, $id]);
        $comment = $query->fetch(PDO::FETCH_OBJ);
        return $comment;
    }

    public function deleteComment($id)
    {
        $query = $this->db->prepare('DELETE FROM comentario WHERE id_comment = ?');
        $query->execute([$id]);
        $comment = $query->fetch(PDO::FETCH_OBJ);
        return $comment;
    }
}
