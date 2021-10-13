<?php
require_once "Controllers/ProtectedAreasController.php";
require_once "Controllers/SpeciesController.php";
require_once "Controllers/HomeController.php";
require_once "Controllers/LoginController.php";



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
$loginController = new LoginController();

switch ($params[0]) {
    case 'login':
        $loginController->showLogin();
        break;
    case 'signup':
        $loginController->showSignup();
        break;
    case 'addUser':
        $loginController->addUser();
        break;
    case 'verifyUser':
        $loginController->verifyUser();
        break;
    case 'logout':
        $loginController->logout();
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
    case 'especies':
        $speciesController->showSingleSpecies($params[1]);
        break;
    case 'especiesDelParque':
        $protectedAreasController->showSpeciesbyProtectedArea($params[1]);
        break;
    case 'area':
        $protectedAreasController->showSingleArea();
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
    case 'updateAreaDB': {
            $protectedAreasController->updateArea();
        }
        break;
    default:
        $homeController->renderError();
        break;
}
