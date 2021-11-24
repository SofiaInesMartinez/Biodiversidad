<?php
class UsersModel{
    private $db;

    function __construct()
    {
        $this->db = new PDO('mysql:host=localhost;' . 'dbname=biodiversidad;charset=utf8', 'root', '');
    }
    function getUsers() {
        $query = $this->db->prepare('SELECT * FROM usuario');
        $query->execute();
        $users = $query->fetchAll(PDO::FETCH_OBJ);
        return $users;
    }
    function getUserByMail($mail) {
        $query = $this->db->prepare('SELECT * FROM usuario WHERE mail = ?');
        $query->execute([$mail]);
        $user = $query->fetch(PDO::FETCH_OBJ);
        return $user;
    }
    function getUserByID($id) {
        $query = $this->db->prepare('SELECT * FROM usuario WHERE id_usuario = ?');
        $query->execute([$id]);
        $user = $query->fetch(PDO::FETCH_OBJ);
        return $user;
    }
    function addUser($name, $mail, $pass) {
        $query = $this->db->prepare("INSERT INTO usuario(rol, nombre, mail, clave) VALUES(?, ?, ?, ?)");
        $query->execute(array("user", $name, $mail, $pass));
    }
    function updateUser($id, $rol) {
        $query = $this->db->prepare("UPDATE usuario SET rol = ? WHERE id_usuario = $id");
        $query->execute(array($rol));
    }
    function deleteUser($id)
    {
        $query = $this->db->prepare("DELETE FROM usuario WHERE id_usuario = ?");
        $query->execute(array($id));
    }
}