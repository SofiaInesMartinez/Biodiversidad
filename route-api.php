<?php
require_once 'libs/Router.php';
require_once './Controllers/ApiCommentsController.php';
require_once './Controllers/ApiUsersController.php';

$router = new Router();

$router->addRoute('comentarios', 'GET', 'ApiCommentsController', 'getComments');
$router->addRoute('comentarios', 'POST', 'ApiCommentsController', 'addComment');
$router->addRoute('comentarios/:ID', 'DELETE', 'ApiCommentsController', 'deleteComment');
/* $router->addRoute('comentario/:ID', 'PUT', 'ApiCommentsController', 'updateComment'); */
/* $router->addRoute('comentario/:ID', 'GET', 'ApiCommentsController', 'getComment'); */
//Entiendo que no hace falta actualizar ni obtener de a un comment

$router->addRoute('usuario', 'GET', 'ApiUsersController', 'getUsers');
$router->addRoute('usuario/:ID', 'PUT', 'ApiUsersController', 'updateUser');
$router->addRoute('usuario/:ID', 'DELETE', 'ApiUsersController', 'deleteUser');

$router->route($_GET["resource"], $_SERVER['REQUEST_METHOD']);



