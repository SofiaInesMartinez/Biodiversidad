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
        if (isset($params[1]))
            $speciesController->deleteSpecies($params[1]);
        else
            $speciesController->renderError('Falta especificar información');
        break;
    case 'addSpecies':
        $speciesController->addSpecies();
        break;
    case 'updateSpecies':
        if (isset($params[1]))
            $speciesController->getSingleSpecies($params[1]);
        else
            $speciesController->renderError('Falta especificar información');
        break;
    case 'updateSpeciesDB':
        $speciesController->updateSpecies();
        break;
    case 'deleteArea':
        if (isset($params[1]))
            $protectedAreasController->deleteArea($params[1]);
        else
            $protectedAreasController->renderError('Falta especificar información');
        break;
    case 'addArea':
        $protectedAreasController->addArea();
        break;
    case 'updateArea':
        if (isset($params[1]))
            $protectedAreasController->getSingleArea($params[1]);
        else
            $protectedAreasController->renderError('Falta especificar información');
        break;
    case 'updateAreaDB':
        $protectedAreasController->updateArea();
        break;
    case 'searchSpecies':
        $speciesController->searchSpecies();
        break;
    default:
        $homeController->renderError();
        break;
}
