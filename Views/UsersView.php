<?php
require_once('libs/Smarty.class.php');

class UsersView
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
    
    function showUsers($users)
    {
        $this->smarty->assign('users', $users);
        $this->smarty->display('templates/users.tpl');
    }

    function renderError($msg)
    {
        $this->smarty->assign('msg', $msg);
        $this->smarty->display('templates/error.tpl');   
    }
}