<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/style.css">
    <title>Biodiversidad</title>
</head>

<body class="background">
    <h1>Registrarme</h1>
    <div class="formUser">
        <form action="addUser" method="POST">
            <input type="name" name="nombre" placeholder="Full name" required>
            <input type="email" name="mail" placeholder="Mail" required>
            <input type="password" name="contrasena" placeholder="Password" required>
            <input type="submit" value="Registrar">
        </form>
        {if $result != ""}
            <p class="result">{$result}</p>
        {/if}
        <a href="login">Iniciar sesión</a>
    </div>

{include 'templates/footer.tpl'}