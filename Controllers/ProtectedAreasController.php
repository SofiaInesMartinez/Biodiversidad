<?php
require_once './Models/ProtectedAreasModel.php';
require_once './Views/ProtectedAreasView.php';
require_once './Models/SpeciesModel.php';
require_once './Helpers/AuthHelper.php';

class ProtectedAreasController
{
    private $model;
    private $view;
    private $authHelper;
    private $speciesModel;

    public function __construct()
    {
        $this->model = new ProtectedAreasModel();
        $this->view = new ProtectedAreasView();
        $this->authHelper = new AuthHelper();
        $this->speciesModel = new SpeciesModel();
    }

    function showPaginationAreas()
    {
        $results_per_page = 10;
        $number_of_results = $this->model->getTotal();
        $number_of_pages = ceil($number_of_results / $results_per_page);
        if (!isset($_GET['page']) || ($_GET['page'] == '')) {
            $page = 1;
        } else {
            $page = $_GET['page'];
        }
        $this_page_first_result = ($page - 1) * $results_per_page;
        $areas = $this->model->getAreasByLimit($this_page_first_result, $results_per_page);
        $user = $this->authHelper->checkClearence();
        $this->view->renderAreas($areas, $number_of_pages, $user);
    }

    function deleteArea($id)
    {
        $this->authHelper->checkLoggedIn();
        if (isset($id) && $id != '') {
            $area = $this->model->getSingleProtectedArea($id);
            if ($area) {
                $this->model->deleteArea($id);
                header("Location: " . BASE_URL . "listaParques");
            } else
                $this->view->renderError("El área id=$id no existe");
        } else
            $this->view->renderError("Faltan datos");
    }

    function addArea()
    {
        $this->authHelper->checkLoggedIn();
        if (
            isset($_POST['nombre']) && isset($_POST['region']) && isset($_POST['ubicacion'])
            && isset($_POST['anio_creacion']) && isset($_POST['superficie']) && ($_POST['nombre'] != '')
            && ($_POST['region'] != '') && ($_POST['ubicacion'] != '') && ($_POST['anio_creacion'] != '')
            && ($_POST['superficie'] != '')
        ) {
            $nombre = $_POST["nombre"];
            $region = $_POST["region"];
            $ubicacion = $_POST["ubicacion"];
            $anio_creacion =  $_POST["anio_creacion"];
            $superficie = $_POST["superficie"];
            if ($_FILES['img']['type'] == "image/jpg" || $_FILES['img']['type'] == "image/jpeg" || $_FILES['img']['type'] == "image/png") {
                $this->model->addArea($nombre, $region, $ubicacion, $anio_creacion, $superficie, $_FILES['img']['tmp_name']);
            } else
                $this->model->addArea($nombre, $region, $ubicacion, $anio_creacion, $superficie, null);
            header("Location: " . BASE_URL . "listaParques");
        } else
            $this->view->renderError("Faltan datos");
    }

    function showSingleArea($id_PN)
    {
        $user = $this->authHelper->checkClearence();
        if (isset($id_PN) && ($id_PN != '')) {
            $area = $this->model->getSingleProtectedArea($id_PN);
            if ($area)
                $this->view->renderSingleArea($area, $user);
            else
                $this->view->renderError("El area id=$id_PN no existe");
        } else
            $this->view->renderError("Faltan datos");
    }

    function showSpeciesbyProtectedArea($id_parque)
    {
        if (isset($id_parque) && $id_parque != '') {
            $species = $this->speciesModel->getSpeciesbyProtectedArea($id_parque);
            $nombreParque = $this->model->getSingleProtectedArea($id_parque);
            $this->view->renderSpeciesByProtectedArea($id_parque, $species, $nombreParque->nombre);
        } else
            $this->view->renderError("Faltan datos");
    }


    function getSingleArea($id)
    {
        $this->authHelper->checkLoggedIn();
        if (isset($id) && $id != '') {
            $area = $this->model->getSingleProtectedArea($id);
            if ($area)
                $this->view->getSingleProtectedArea($area);
            else
                $this->view->renderError("El area id=$id no existe");
        } else
            $this->view->renderError("Faltan datos");
    }

    function updateArea()
    {
        $this->authHelper->checkLoggedIn();
        if (
            isset($_POST['nombre']) && isset($_POST['region']) && isset($_POST['ubicacion'])
            && isset($_POST['anio_creacion']) && isset($_POST['superficie']) && ($_POST['nombre'] != '')
            && ($_POST['region'] != '') && ($_POST['ubicacion'] != '') && ($_POST['anio_creacion'] != '')
            && ($_POST['superficie'] != '')
        ) {
            $nombre = $_POST["nombre"];
            $region = $_POST["region"];
            $ubicacion = $_POST["ubicacion"];
            $anio_creacion = $_POST["anio_creacion"];
            $superficie = $_POST["superficie"];
            $id_PN = $_POST["id_PN"];
            if ($_FILES['img']['type'] == "image/jpg" || $_FILES['img']['type'] == "image/jpeg" || $_FILES['img']['type'] == "image/png") {
                $this->model->updateArea($nombre, $region, $ubicacion, $anio_creacion, $superficie,  $_FILES['img']['tmp_name'], $id_PN);
            } else
                $this->model->updateArea($nombre, $region, $ubicacion, $anio_creacion, $superficie, null, $id_PN);
            header("Location: " . BASE_URL . "listaParques");
        } else
            $this->view->renderError("Faltan datos");
    }

    function renderError($msg)
    {
        $this->view->renderError($msg);
    }
}
