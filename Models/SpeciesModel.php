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
        $query = $this->db->prepare('SELECT * FROM especie');
        $query->execute();
        $count = $query->rowCount();
        return $count;
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


    function getSpeciesBySearch($nombre_cientifico, $nombre_comun, $estado_conservacion)
    {
        if ($nombre_cientifico != '')
            $n_cientifico = "%$nombre_cientifico%";
        else
            $n_cientifico = '%';
        if ($nombre_comun != '')
            $n_comun = "%$nombre_comun%";
        else
            $n_comun = '%';
        if ($estado_conservacion != '')
            $est_cons = $estado_conservacion;
        else
            $est_cons = '%';

        $query = $this->db->prepare("SELECT a.*, b.nombre FROM especie a LEFT JOIN parquenacional b
        ON a.id_parque = b.id_PN WHERE nombre_cientifico LIKE ? AND nombre_comun LIKE ? AND estado_conservacion LIKE ?");
        $query->execute([$n_cientifico, $n_comun, $est_cons]);
        $species = $query->fetchAll(PDO::FETCH_OBJ);
        return $species;
    }

    function getConservationStates()
    {
        $query = $this->db->prepare('SELECT DISTINCT estado_conservacion FROM especie ORDER BY estado_conservacion');
        $query->execute([]);
        $states = $query->fetchAll(PDO::FETCH_COLUMN);
        return $states;
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
        $sentencia->execute(array($nombre_cientifico, $nombre_comun, $descripcion, $estado_conservacion, $id_parque, $img));
    }

    function updateSpecies($nombre_cientifico, $nombre_comun, $descripcion, $estado_conservacion, $id_parque, $img, $id_especie)
    {
        $sentencia = $this->db->prepare("UPDATE especie SET nombre_cientifico = ?, nombre_comun = ?, descripcion = ?, estado_conservacion = ?, id_parque = ?, img=? WHERE id_especie= ?");
        $sentencia->execute([$nombre_cientifico, $nombre_comun, $descripcion, $estado_conservacion, $id_parque, $img, $id_especie]);
    }
}
