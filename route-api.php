<?php
require_once 'libs/Router.php';
require_once './Controllers/ApiCommentsController.php';

$router = new Router();

$router->addRoute('api/comentarios', 'GET', 'ApiCommentsController', 'getComments');
$router->addRoute('api/comentarios', 'POST', 'ApiCommentsController', 'addComment');
$router->addRoute('api/comentarios/:ID', 'PUT', 'ApiCommentsController', 'updateComment');
$router->addRoute('api/comentarios/:ID', 'DELETE', 'ApiCommentsController', 'deleteComment');
$router->addRoute('api/comentarios/:ID', 'GET', 'ApiCommentsController', 'getComment');


$router->route($_GET["resource"], $_SERVER['REQUEST_METHOD']);



