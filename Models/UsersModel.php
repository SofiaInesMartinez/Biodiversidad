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
    function getUser($mail) {
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
        $sentencia = $this->db->prepare("INSERT INTO usuario(rol, nombre, mail, clave) VALUES(?, ?, ?, ?)");
        $sentencia->execute(array("user", $name, $mail, $pass));
    }
    function updateUser($id, $rol) {
        $sentencia = $this->db->prepare("UPDATE usuario SET rol = ? WHERE id_usuario = $id");
        $sentencia->execute(array($rol));
        $user = $sentencia->fetch(PDO::FETCH_OBJ);
        return $user;
    }
    function deleteUser($id)
    {
        $sentencia = $this->db->prepare("DELETE FROM usuario WHERE id_usuario = ?");
        $sentencia->execute(array($id));
        $user = $sentencia->fetch(PDO::FETCH_OBJ);
        return $user;
    }
}