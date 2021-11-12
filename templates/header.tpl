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
    <nav>
        <nav class="nav-btn">
            <div>
                <ul>
                    <li><a href="home">INICIO</a></li>
                    <li><a href="listaEspecies">ESPECIES</a></li>
                    <li><a href="listaParques">PARQUES</a></li>
                </ul>
            </div>
        </nav>
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
</nav>