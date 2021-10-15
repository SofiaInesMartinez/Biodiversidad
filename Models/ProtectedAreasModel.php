<?php
class ProtectedAreasModel
{
    private $db;

    function __construct()
    {
        $this->db = new PDO('mysql:host=localhost;' . 'dbname=biodiversidad;charset=utf8', 'root', '');
    }
    function getTotal()
    {
        $query = $this->db->prepare('SELECT *, COUNT(*) AS total FROM parquenacional');
        $query->execute();
        $count = $query->fetch(PDO::FETCH_OBJ);
        return $count->total;
    }
    
    function getAreasByLimit($this_page_first_result, $results_per_page)
    {
        $query = $this->db->prepare("SELECT * FROM parquenacional ORDER BY region, nombre
        LIMIT " . $this_page_first_result . "," .  $results_per_page);
        $query->execute();
        $species = $query->fetchAll(PDO::FETCH_OBJ);
        return $species;
    }
    function getProtectedAreas()
    {
        $query = $this->db->prepare('SELECT * FROM parquenacional ORDER BY region, nombre');
        $query->execute();
        $areas = $query->fetchAll(PDO::FETCH_OBJ);
        return $areas;
    }

    function getSingleProtectedArea($id_PN)
    {
        $query = $this->db->prepare('SELECT * FROM parquenacional WHERE id_PN=?');
        $query->execute([$id_PN]);
        $area = $query->fetch(PDO::FETCH_OBJ);
        return $area;
    }

    function deleteArea($id)
    {
        $sentencia = $this->db->prepare("DELETE FROM parquenacional WHERE id_PN = ?");
        $sentencia->execute(array($id));
    }

    function addArea($nombre, $region, $ubicacion, $anio_creacion, $superficie, $img)
    {
        $sentencia = $this->db->prepare('INSERT INTO parquenacional(nombre, region, ubicacion, anio_creacion, superficie, img) VALUES(?, ?, ?, ?, ?, ?)');
        $sentencia->execute(array($nombre, $region, $ubicacion, $anio_creacion, $superficie, $img));
    }

    function updateArea($nombre, $region, $ubicacion, $anio_creacion, $superficie, $img, $id_PN)
    {
        $sentencia = $this->db->prepare("UPDATE parquenacional SET nombre = ?, region = ?, ubicacion = ?, anio_creacion = ?, superficie = ?, img=? WHERE id_PN = ?");
        $sentencia->execute(array($nombre, $region, $ubicacion, $anio_creacion, $superficie, $img, $id_PN));
    }
}
