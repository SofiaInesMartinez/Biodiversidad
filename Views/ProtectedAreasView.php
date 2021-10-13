<?php
require_once('libs/Smarty.class.php');

class ProtectedAreasView
{
    private $smarty;

    function __construct()
    {
        $this->smarty = new Smarty();
    }

    function renderAreas($areas, $maxPages, $adm)
    {
        $this->smarty->assign('areas', $areas);
        $this->smarty->assign('maxPages', $maxPages);
        $this->smarty->assign('adm', $adm);
        $this->smarty->display('templates/listAreas.tpl');
    }

    function renderSingleArea($area, $adm)
    {
        $this->smarty->assign('area', $area);
        $this->smarty->assign('adm', $adm);
        $this->smarty->display('templates/singleArea.tpl');
    }

    function renderError($msg)
    {
        $this->smarty->assign('msg', $msg);
        $this->smarty->display('templates/error.tpl');   
    }

    function renderSpeciesByProtectedArea($id_parque, $species, $nameArea, $adm)
    {
        $this->smarty->assign('id_parque', $id_parque);
        $this->smarty->assign('species', $species);
        $this->smarty->assign('area', $nameArea);
        $this->smarty->assign('adm', $adm);
        $this->smarty->display('templates/speciesByArea.tpl');
    }
        

    function getSingleProtectedArea($areas){
        $this->smarty->assign('areas', $areas);
        $this->smarty->display('templates/updateArea.tpl');
    }
    
}