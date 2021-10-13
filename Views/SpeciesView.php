<?php
class SpeciesView
{
    private $smarty;

    function __construct()
    {
        $this->smarty = new Smarty();
    }

    function renderSpecies($species, $areas, $maxPages, $adm) {
        $this->smarty->assign('especies', $species);
        $this->smarty->assign('areas', $areas);
        $this->smarty->assign('maxPages', $maxPages);
        $this->smarty->assign('adm', $adm);
        $this->smarty->display('templates/listSpecies.tpl');
    }


    function renderSingleSpecies($species, $adm){
        $this->smarty->assign('especies', $species);
        $this->smarty->assign('adm', $adm);
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