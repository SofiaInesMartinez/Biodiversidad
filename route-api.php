<?php
require_once 'libs/Router.php';
require_once './Controllers/ApiCommentsController.php';
require_once './Controllers/ApiUsersController.php';

$router = new Router();

$router->addRoute(':ID_PN/comentarios', 'GET', 'ApiCommentsController', 'getComments');
$router->addRoute(':ID_PN/comentarios', 'POST', 'ApiCommentsController', 'addComment');
$router->addRoute(':ID_PN/comentarios/:ID', 'DELETE', 'ApiCommentsController', 'deleteComment');
$router->addRoute(':ID_PN/comentarios/:SCORE', 'GET', 'ApiCommentsController', 'getCommentsByScore');

$router->route($_GET["resource"], $_SERVER['REQUEST_METHOD']);