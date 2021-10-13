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

<h1>Especies presentes en {$area}</h2>
    <table>
        <thead>
            <tr>
                <th>Nombre científico</th>
                <th>Nombre común</th>
                <th>Estado de conservación</th>
            </tr>
            <thead>
            <tbody>
                {foreach from=$species item=$specie}
                    <tr>
                        <td><i><a href="especies/{$specie->id_especie}">{$specie->nombre_cientifico}</i></a></td>
                        <td>{$specie->nombre_comun}</td>
                        <td>{$specie->estado_conservacion}</td>
                    </tr>
                {/foreach}
    </table>



{include file="templates/footer.tpl"}