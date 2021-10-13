<?php
require_once('libs/Smarty.class.php');

class LoginView
{
    private $smarty;

    function __construct()
    {
        $this->smarty = new Smarty();
    }

    function showLogin($error)
    {
        $this->smarty->assign('error', $error);
        $this->smarty->display('templates/login.tpl');
    }
    
    function showSignup($result)
    {
        $this->smarty->assign('result', $result);
        $this->smarty->display('templates/signUp.tpl');
    }
    
}