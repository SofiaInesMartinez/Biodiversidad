{include file="templates/header.tpl"}

<nav class="nav-user">
    <div>
        <ul>
            {if $adm != ""}
                <li>Bienvenido {$adm}</li>
                <li><a href="logout">LOG OUT</a></li>
            {/if}
            {if $adm == ""}
                <li><a href="login">LOG IN</a></li>
            {/if}
        </ul>
    </div>
</nav>
</nav>

<h1><i>{$especies->nombre_cientifico}</i></h1>
<h2>{$especies->nombre_comun}</h2>
<figure>
    <img src="{$especies->img}">

    <div>
        <h3>{$especies->estado_conservacion}</h3>
        <p>{$especies->descripcion}</p>
        <h2>{$especies->nombre}</h2>
    </div>
</figure>


{include file="templates/footer.tpl"}