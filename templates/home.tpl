<!DOCTYPE html>
<html lang="en">

<head>
    <base href="{BASE_URL}">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/style.css">
    <script src="https://kit.fontawesome.com/d2fd5a763a.js" crossorigin="anonymous"></script>
    <title>Biodiversidad</title>
</head>

<body>
    <nav class="nav-user">
        <div>
            <ul>
                {if isset($smarty.SESSION.NOMBRE)}
                    <li>Bienvenido {$smarty.SESSION.NOMBRE}</li>
                    <li><a href="logout">LOG OUT</a></li>
                {else}
                    <li><a href="login">LOG IN</a></li>
                {/if}
            </ul>
        </div>
    </nav>
    <main>
        <section id="home">
            <h1>Biodiversidad de las áreas protegidas de Argentina</h1>
        </section>
        <section id="content">

            <div class="btn-container">
                <a href="listaEspecies">
                    <img src="images/2.jpg">
                    <div>
                        <h3>Especies</h3>
                    </div>
                </a>
            </div>
            <div class="btn-container">
                <a href="listaParques">
                    <img src="images/3.png">
                    <div>
                        <h3>Áreas protegidas</h3>
                    </div>
                </a>
            </div>
            {if isset($smarty.SESSION.ROL) && ($smarty.SESSION.ROL === 'adm')}
            <div class="btn-container">
                <a href="usuarios">
                    <img src="images/4.jpg">
                    <div>
                        <h3>Usuarios</h3>
                    </div>
                </a>
            </div>
            {/if}
        </section>


    </main>

{include file="templates/footer.tpl"}