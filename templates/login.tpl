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
    <h1>Iniciar sesión</h1>
    <div class="formUser">
        <form action="verifyUser" method="POST">
            <input type="email" name="mail" placeholder="Mail" required>
            <input type="password" name="contrasena" placeholder="Password" required>
            <input type="submit" value="Ingresar">
        </form>
        {if $error != ""}
            <p class="error">{$error}</p>
        {/if}
        <a href="signup">Registrarme</a>
    </div>

{include 'templates/footer.tpl'}