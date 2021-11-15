<?php
require_once 'libs/Router.php';
require_once './Controllers/ApiCommentsController.php';

$router = new Router();

$router->addRoute('comentarios', 'GET', 'ApiCommentsController', 'getComments');
$router->addRoute('comentarios', 'POST', 'ApiCommentsController', 'addComment');
$router->addRoute('comentarios/:ID', 'PUT', 'ApiCommentsController', 'updateComment');
$router->addRoute('comentarios/:ID', 'DELETE', 'ApiCommentsController', 'deleteComment');
$router->addRoute('comentarios/:ID', 'GET', 'ApiCommentsController', 'getComment');


$router->route($_GET["resource"], $_SERVER['REQUEST_METHOD']);



