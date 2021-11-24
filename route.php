<?php
require_once "Controllers/ProtectedAreasController.php";
require_once "Controllers/SpeciesController.php";
require_once "Controllers/HomeController.php";
require_once "Controllers/UserController.php";



define('BASE_URL', '//' . $_SERVER['SERVER_NAME'] . ':' . $_SERVER['SERVER_PORT'] . dirname($_SERVER['PHP_SELF']) . '/');


if (!empty($_GET['action'])) {
    $action = $_GET['action'];
} else {
    $action = 'home';
}

$params = explode('/', $action);

$protectedAreasController = new ProtectedAreasController();
$speciesController = new SpeciesController();
$homeController = new HomeController();
$userController = new UserController();

switch ($params[0]) {
    case 'login':
        $userController->showLogin();
        break;
    case 'signup':
        $userController->showSignup();
        break;
    case 'addUser':
        $userController->addUser();
        break;
    case 'verifyUser':
        $userController->verifyUser();
        break;
    case 'logout':
        $userController->logout();
        break;
    case 'home':
        $homeController->showHome();
        break;
    case 'listaEspecies':
        $speciesController->showPaginationSpecies();
        break;
    case 'listaParques':
        $protectedAreasController->showPaginationAreas();
        break;
    case 'usuarios':
        $userController->showUsers();
        break;
    case 'especies':
        $speciesController->showSingleSpecies($params[1]);
        break;
    case 'especiesDelParque':
        $protectedAreasController->showSpeciesbyProtectedArea($params[1]);
        break;
    case 'area':
        $protectedAreasController->showSingleArea($params[1]);
        break;
    case 'deleteSpecies':
        $speciesController->deleteSpecies($params[1]);
        break;
    case 'addSpecies':
        $speciesController->addSpecies();
        break;
    case 'updateSpecies':
        $speciesController->getSingleSpecies($params[1]);
        break;
    case 'updateSpeciesDB':
        $speciesController->updateSpecies();
        break;
    case 'deleteArea':
        $protectedAreasController->deleteArea($params[1]);
        break;
    case 'addArea':
        $protectedAreasController->addArea();
        break;
    case 'updateArea':
        $protectedAreasController->getSingleArea($params[1]);
        break;
    case 'updateAreaDB':
        $protectedAreasController->updateArea();
        break;
    case 'updateImgAreaDB':
        $protectedAreasController->updateImgArea();
        break;
    case 'searchSpecies':
        $speciesController->searchSpecies();
        break;
    default:
        $homeController->renderError();
        break;
}
