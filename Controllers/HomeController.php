<?php
require_once './Views/HomeView.php';
require_once './Helpers/AuthHelper.php';

class HomeController
{
    private $view;

    public function __construct()
    {
        $this->view = new HomeView();
    }

    function showHome()
    {
        $this->view->showHome();
    }

    function renderError()
    {
        $this->view->renderError("404 Page not found");
    }
}
