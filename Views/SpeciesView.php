<?php
class SpeciesView
{
    private $smarty;

    function __construct()
    {
        $this->smarty = new Smarty();
    }

    function renderSpecies($species, $areas, $estados, $maxPages, $user) {
        $this->smarty->assign('especies', $species);
        $this->smarty->assign('areas', $areas);
        $this->smarty->assign('estados', $estados);
        $this->smarty->assign('maxPages', $maxPages);
        $this->smarty->assign('user', $user);
        $this->smarty->display('templates/listSpecies.tpl');
    }

    function renderFilteredSpecies($species, $estados){
        $this->smarty->assign('especies', $species);
        $this->smarty->assign('estados', $estados);
        $this->smarty->display('templates/searchSpecies.tpl');
    }

    function renderSingleSpecies($species){
        session_start();
        $this->smarty->assign('especies', $species);
        $this->smarty->display('templates/singleSpecie.tpl');
    }

    function getSingleSpecies($species, $areas){
        $this->smarty->assign('especies', $species);
        $this->smarty->assign('areas', $areas);
        $this->smarty->display('templates/updateSpecie.tpl');
    }

    function renderError($msg)
    {
        $this->smarty->assign('msg', $msg);
        $this->smarty->display('templates/error.tpl');   
    }

}