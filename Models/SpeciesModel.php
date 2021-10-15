<?php
class SpeciesModel
{
    private $db;

    function __construct()
    {
        $this->db = new PDO('mysql:host=localhost;' . 'dbname=biodiversidad;charset=utf8', 'root', '');
    }

    function getTotal()
    {
        $query = $this->db->prepare('SELECT *, COUNT(*) AS total FROM especie');
        $query->execute();
        $count = $query->fetch(PDO::FETCH_OBJ);
        return $count->total;
    }

    function getSpeciesByLimit($this_page_first_result, $results_per_page)
    {
        $query = $this->db->prepare("SELECT a.*, b.* FROM especie a LEFT JOIN parquenacional
                 b ON a.id_parque = b.id_PN ORDER BY nombre_cientifico LIMIT " . $this_page_first_result .
                 "," .  $results_per_page);
        $query->execute();
        $species = $query->fetchAll(PDO::FETCH_OBJ);
        return $species;
    }

    function getSingleSpecies($id_especie)
    {
        $query = $this->db->prepare('SELECT a.*, b.nombre FROM especie a LEFT JOIN parquenacional b
         ON a.id_parque = b.id_PN WHERE id_especie=?');
        $query->execute([$id_especie]);
        $species = $query->fetch(PDO::FETCH_OBJ);
        return $species;
    }

    function getSpeciesbyProtectedArea($protectedArea)
    {
        $query = $this->db->prepare('SELECT * FROM especie WHERE id_parque = ? ORDER BY nombre_cientifico');
        $query->execute([$protectedArea]);
        $species = $query->fetchAll(PDO::FETCH_OBJ);
        return $species;
    }

    function deleteSpecies($id)
    {
        $sentencia = $this->db->prepare("DELETE FROM especie WHERE id_especie = ?");
        $sentencia->execute(array($id));
    }

    function addSpecies($nombre_cientifico, $nombre_comun, $descripcion, $estado_conservacion, $id_parque, $img)
    {
        $sentencia = $this->db->prepare("INSERT INTO especie(nombre_cientifico, nombre_comun, descripcion, estado_conservacion, id_parque, img) VALUES(?, ?, ?, ?, ?, ?)");
        $sentencia->execute(array($nombre_cientifico, $nombre_comun, $descripcion,  $estado_conservacion, $id_parque, $img));
    }

    function updateSpecies($nombre_cientifico, $nombre_comun, $descripcion, $estado_conservacion, $id_parque, $img, $id_especie)
    {
        $sentencia = $this->db->prepare("UPDATE especie SET nombre_cientifico = ?, nombre_comun = ?, descripcion = ?, estado_conservacion = ?, id_parque = ?, img=? WHERE id_especie= ?");
        $sentencia->execute(array($nombre_cientifico, $nombre_comun, $descripcion,  $estado_conservacion, $id_parque, $img, $id_especie));
    }

}
