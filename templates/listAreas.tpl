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

<h1>Áreas protegidas de Argentina</h1>
<table>
    <thead>
        <tr>
            <th>Área protegida</th>
            <th>Región</th>
            <th>Ubicación</th>
            <th>Año de creación</th>
            <th>Superficie (ha)</th>
            <th>Especies</th>
        </tr>
        <thead>
        <tbody>
            {foreach from=$areas item=$area}
                <tr>
                    <td><a href="area?id={$area->id_PN}">{$area->nombre}</a></td>
                    <td>{$area->region}</td>
                    <td>{$area->ubicacion}</td>
                    <td>{$area->anio_creacion}</td>
                    <td>{$area->superficie}</td>
                    <td><a href='especiesDelParque/{$area->id_PN}'>Ver especies</a></td>
                    <td class="td-btn {if $adm == ""} hide {/if}">
                        <a title="Eliminar" href="deleteArea/{$area->id_PN}"><i class="far fa-trash-alt"></i></a>
                        <a title="Actualizar" href="updateArea/{$area->id_PN}"><i class="far fa-edit"></i></a>
                    </td>
                </tr>
            {/foreach}
        </tbody>
</table>

<div class="pages">
    {for $page=1 to $maxPages}
        <a href="listaParques?page={$page} ">{$page}</a>
    {/for}
</div>

<section {if $adm == ""} class="hide" {/if}>
    <h2>Acceso administador - Alta</h2>
    <div class="formHome">
        <img id="arbol1" src="images/arbol.png">
        <form class="ABMForm" action="addArea" method="post">
            <input name="nombre" type="text" placeholder="Nombre" required>
            <input name="region" type="text" placeholder="Región" required>
            <input name="ubicacion" type="text" placeholder="Ubicación" required>
            <input name="anio_creacion" type="number" placeholder="Año de creación" required>
            <input name="superficie" type="number" placeholder="Superficie (ha)" required>
            <input name="img" type="text" placeholder="Enlace a imagen" required>
            <input type="submit" value="Cargar">
        </form>
        <img id="arbol2" src="images/arbol.png">
        <div class="formHome">
</section>


{include file="templates/footer.tpl"}