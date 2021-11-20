<?php
require_once './Models/SpeciesModel.php';
require_once './Views/SpeciesView.php';
require_once './Helpers/AuthHelper.php';
require_once './Models/ProtectedAreasModel.php';

class SpeciesController
{
    private $model;
    private $modelArea;
    private $view;
    private $authHelper;

    public function __construct()
    {
        $this->model = new SpeciesModel();
        $this->view = new SpeciesView();
        $this->authHelper = new AuthHelper();
        $this->modelArea = new ProtectedAreasModel();
    }


    public function searchSpecies($params = null)
    {
        if (isset($_GET['nombre_cientifico']) && ($_GET['nombre_cientifico'] != '')) {
            $nombre_cientifico = $_GET['nombre_cientifico'];
        } else
            $nombre_cientifico = '';
        if (isset($_GET['nombre_comun']) && ($_GET['nombre_comun'] != '')) {
            $nombre_comun = $_GET['nombre_comun'];
        } else
            $nombre_comun = '';
        if (isset($_GET['estado_conservacion']) && ($_GET['estado_conservacion'] != '')) {
            $estado_conservacion = $_GET['estado_conservacion'];
        } else
            $estado_conservacion = '';
        $species = $this->model->getSpeciesBySearch($nombre_cientifico, $nombre_comun, $estado_conservacion);
        $estados = $this->model->getConservationStates();
        return $this->view->renderFilteredSpecies($species, $estados);
    }


    function showPaginationSpecies()
    {
        $results_per_page = 10; //variable de cant de resultados deseados por pagina (limite)
        $number_of_results = $this->model->getTotal(); //obtiene cantidad de la tabla
        $number_of_pages = ceil($number_of_results / $results_per_page); //calcula cant de paginas existenes, ceil devuelve la division redondeada
        if (!isset($_GET['page']) || ($_GET['page'] == '')) { //si no se especifica pagina se muestra la primera
            $page = 1;
        } else {
            $page = $_GET['page'];
        }
        $this_page_first_result = ($page - 1) * $results_per_page; //obtiene inicio de la porcion de la tabla requerida
        $species = $this->model->getSpeciesByLimit($this_page_first_result, $results_per_page);
        $areas = $this->modelArea->getProtectedAreas();
        $user = $this->authHelper->checkClearence();
        $estados = $this->model->getConservationStates();
        $this->view->renderSpecies($species, $areas, $estados, $number_of_pages, $user);
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
        if (
            isset($_POST['nombre_cientifico']) && isset($_POST['nombre_comun']) && isset($_POST['descripcion'])
            && isset($_POST['estado_conservacion']) && isset($_POST['id_parque']) && ($_POST['nombre_cientifico'] != '')
            && ($_POST['nombre_comun'] != '') && ($_POST['descripcion'] != '') && ($_POST['estado_conservacion'] != '')
            && ($_POST['id_parque'] != '')
        ) {
            $nombre_cientifico = $_POST["nombre_cientifico"];
            $nombre_comun = $_POST["nombre_comun"];
            $descripcion = $_POST["descripcion"];
            $estado_conservacion = $_POST["estado_conservacion"];
            $id_parque = $_POST["id_parque"];
            $img = $_POST["img"];
            $this->model->addSpecies($nombre_cientifico, $nombre_comun, $descripcion,  $estado_conservacion, $id_parque, $img);
            header("Location: " . BASE_URL . "listaEspecies");
        }
        //$this->view->renderError("La especie ya existe"); //Para este control dijo que es mejor un get especie

    }

    function showSingleSpecies($id)
    {
        $specie = $this->model->getSingleSpecies($id);
        $this->view->renderSingleSpecies($specie);
    }

    function getSingleSpecies($id)
    {
        $this->authHelper->checkLoggedIn();
        $specie = $this->model->getSingleSpecies($id);
        $areas = $this->modelArea->getProtectedAreas();
        $this->view->getSingleSpecies($specie, $areas);
    }

    function updateSpecies()
    {
        $this->authHelper->checkLoggedIn();
        if (
            isset($_POST['nombre_cientifico']) && isset($_POST['nombre_comun']) && isset($_POST['descripcion'])
            && isset($_POST['estado_conservacion']) && isset($_POST['id_parque']) && ($_POST['nombre_cientifico'] != '')
            && ($_POST['id_parque'] != '')
        ) {
            $nombre_cientifico = $_POST["nombre_cientifico"];
            $nombre_comun = $_POST["nombre_comun"];
            $descripcion = $_POST["descripcion"];
            $estado_conservacion = $_POST["estado_conservacion"];
            $id_parque = $_POST["id_parque"];
            $img = $_POST["img"];
            $id_especie = $_POST["id_especie"];
            $this->model->updateSpecies($nombre_cientifico, $nombre_comun, $descripcion, $estado_conservacion, $id_parque, $img, $id_especie);
            header("Location: " . BASE_URL . "listaEspecies");
        } else $this->renderError("La especie no fue actualizada");
    }

    function renderError($msg)
    {
        $this->view->renderError($msg);
    }
}
