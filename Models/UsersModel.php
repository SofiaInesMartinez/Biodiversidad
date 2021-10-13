<?php
class UsersModel{
    private $db;

    function __construct()
    {
        $this->db = new PDO('mysql:host=localhost;' . 'dbname=biodiversidad;charset=utf8', 'root', '');
    }
    function getUser($mail) {
        $query = $this->db->prepare('SELECT * FROM usuario WHERE mail = ?');
        $query->execute([$mail]);
        $user = $query->fetch(PDO::FETCH_OBJ);
        return $user;
    }
    function addUser($name, $mail, $pass) {
        $sentencia = $this->db->prepare("INSERT INTO usuario(nombre, mail, clave) VALUES(?, ?, ?)");
        $sentencia->execute(array($name, $mail, $pass));
    }
}