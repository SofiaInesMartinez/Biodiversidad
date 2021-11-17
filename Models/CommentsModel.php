<?php

class CommentsModel
{

    private $db;

    public function __construct()
    {
        $this->db = new PDO('mysql:host=localhost;' . 'dbname=biodiversidad;charset=utf8', 'root', '');
    }

    public function getComments($id_PN)
    {
        if ($id_PN != '') {
            $search = "WHERE id_PN = $id_PN";
        } else
            $search = '';

        $query = $this->db->prepare("SELECT a.*, b.nombre FROM comentario a LEFT JOIN usuario b
        ON a.id_usuario = b.id_usuario $search");
        $query->execute([]);
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
        $comment = $query->fetch(PDO::FETCH_OBJ);
        return $comment;
    }
}
