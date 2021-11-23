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
        $query = $this->db->prepare('SELECT COUNT(*) FROM parquenacional');
        $query->execute();
        $count = $query->fetchColumn();
        return $count;
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
        $query = $this->db->prepare("DELETE FROM parquenacional WHERE id_PN = ?");
        $query->execute(array($id));
    }

    private function uploadImage($image)
    {
        $target = 'uploads/' . uniqid("", true) . "." . strtolower(pathinfo($_FILES['img']['name'], PATHINFO_EXTENSION));
        move_uploaded_file($image, $target);
        return $target;
    }


    function addArea($nombre, $region, $ubicacion, $anio_creacion, $superficie, $img = null)
    {
        $pathImg = null;
        if ($img)
            $pathImg = $this->uploadImage($img);
        $query = $this->db->prepare('INSERT INTO parquenacional(nombre, region, ubicacion, anio_creacion, superficie, img) VALUES(?, ?, ?, ?, ?, ?)');
        $query->execute(array($nombre, $region, $ubicacion, $anio_creacion, $superficie, $pathImg));
    }

    function updateArea($nombre, $region, $ubicacion, $anio_creacion, $superficie, $img = null, $id_PN)
    {
        $pathImg = null;
        if ($img)
            $pathImg = $this->uploadImage($img);
        $query = $this->db->prepare("UPDATE parquenacional SET nombre = ?, region = ?, ubicacion = ?, anio_creacion = ?, superficie = ?, img=? WHERE id_PN = ?");
        $query->execute(array($nombre, $region, $ubicacion, $anio_creacion, $superficie, $pathImg, $id_PN));
    }
}
