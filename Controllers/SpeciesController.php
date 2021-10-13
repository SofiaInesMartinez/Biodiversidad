<?php
require_once './Models/SpeciesModel.php';
require_once './Views/SpeciesView.php';
require_once './Helpers/AuthHelper.php';

class SpeciesController
{
    private $model;
    private $view;
    private $authHelper;

    public function __construct()
    {
        $this->model = new SpeciesModel();
        $this->view = new SpeciesView();
        $this->authHelper = new AuthHelper();
    }

    function showPaginationSpecies()
    {
        $results_per_page = 10; //variable de cant de resultados deseados por pagina (limite)
        $number_of_results = $this->model->getTotal(); //obtiene cantidad de la tabla
        $number_of_pages = ceil($number_of_results / $results_per_page); //calcula cant de paginas existenes, ceil devuelve la division redondeada
        if (!isset($_GET['page'])) { //si no se especifica pagina se muestra la primera
            $page = 1;
        } else {
            $page = $_GET['page'];
        }
        $this_page_first_result = ($page - 1) * $results_per_page; //obtiene inicio de la porcion de la tabla requerida
        $species = $this->model->getSpeciesByLimit($this_page_first_result, $results_per_page);
        $areas = $this->model->selectAreas();
        $adm = $this->authHelper->checkUser();
        $this->view->renderSpecies($species, $areas, $number_of_pages, $adm);
    }

    function deleteSpecies($id)
    {
        $this->authHelper->checkLoggedIn();
        $this->model->deleteSpecies($id);
        header("Location: " . BASE_URL . "listaEspecies");
    }

    function addSpecies()
    {
        $this->authHelper->checkLoggedIn();
        try {
            $nombre_cientifico = $_POST["nombre_cientifico"];
            $nombre_comun = $_POST["nombre_comun"];
            $descripcion = $_POST["descripcion"];
            $estado_conservacion = $_POST["estado_conservacion"];
            $id_parque = $_POST["id_parque"];
            $img = $_POST["img"];
            $this->model->addSpecies($nombre_cientifico, $nombre_comun, $descripcion,  $estado_conservacion, $id_parque, $img);
            header("Location: " . BASE_URL . "listaEspecies");
        } catch (\Throwable $th) {
            $this->view->renderError("La especie ya existe");
        }
    }

    function showSingleSpecies($id)
    {
        $specie = $this->model->getSingleSpecies($id);
        $adm = $this->authHelper->checkUser();
        $this->view->renderSingleSpecies($specie, $adm);
    }

    function getSingleSpecies($id)
    {
        $this->authHelper->checkLoggedIn();
        $specie = $this->model->getSingleSpecies($id);
        $areas = $this->model->selectAreas();
        $this->view->getSingleSpecies($specie, $areas);
        
    }

    function updateSpecies()
    {
        $this->authHelper->checkLoggedIn();
        try {
            $nombre_cientifico = $_REQUEST["nombre_cientifico"];
            $nombre_comun = $_REQUEST["nombre_comun"];
            $descripcion = $_REQUEST["descripcion"];
            $estado_conservacion = $_REQUEST["estado_conservacion"];
            $id_parque = $_REQUEST["id_parque"];
            $img = $_POST["img"];
            $id_especie = $_REQUEST["id_especie"];
            $this->model->updateSpecies($nombre_cientifico, $nombre_comun, $descripcion, $estado_conservacion, $id_parque, $img, $id_especie);
            header("Location: " . BASE_URL . "listaEspecies");
        } catch (\Throwable $th) {
            $this->view->renderError("La especie ya existe");
        }
    }

    function renderError($msg)
    {
        $this->view->renderError($msg);
    }
}
