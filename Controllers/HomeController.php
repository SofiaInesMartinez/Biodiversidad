<?php
require_once './Models/ProtectedAreasModel.php';
require_once './Views/HomeView.php';
require_once './Helpers/AuthHelper.php';

class HomeController
{
    private $model;
    private $view;

    public function __construct()
    {
        $this->model = new ProtectedAreasModel();
        $this->view = new HomeView();
    }

    function showHome()
    {
        $areas = $this->model->getProtectedAreas();
        $this->view->showHome($areas);
    }

    function renderError()
    {
        $this->view->renderError("404 Page not found");
    }
}
