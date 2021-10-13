<?php
require_once './Models/ProtectedAreasModel.php';
require_once './Views/HomeView.php';
require_once './Helpers/AuthHelper.php';

class HomeController
{
    private $model;
    private $view;
    private $authHelper;

    public function __construct()
    {
        $this->model = new ProtectedAreasModel();
        $this->view = new HomeView();
        $this->authHelper = new AuthHelper();
    }

    function showHome()
    {
        $areas = $this->model->getProtectedAreas();
        $nombre = $this->authHelper->checkUser();
        $this->view->showHome($areas, $nombre);
    }

    function renderError()
    {
        $this->view->renderError("404 Page not found");
    }
}
