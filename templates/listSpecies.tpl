{include file="templates/header.tpl"}

<h1>Especies nativas en áreas protegidas</h1>

<main>
    <table>
        <thead>
            <tr>
                <th>Nombre científico</th>
                <th>Nombre común</th>
                <th>Estado de conservación</th>
                <th>Área protegida</th>
                <th> </th>
            </tr>
            <thead>
            <tbody>
                {foreach from=$especies item=$especie}
                    <tr>
                        <td><i><a href='especies/{$especie->id_especie}'>{$especie->nombre_cientifico}</a></i></td>
                        <td>{$especie->nombre_comun}</td>
                        <td>{$especie->estado_conservacion}</td>
                        <td><a href="area/{$especie->id_parque}">{$especie->nombre}</a></td>
                        <td class="td-btn {if $user['rol'] != "adm"} hide {/if}">
                            <a title="Eliminar" href="deleteSpecies/{$especie->id_especie}"><i
                                    class="far fa-trash-alt"></i></a>
                            <a title="Actualizar" href="updateSpecies/{$especie->id_especie}"><i
                                    class="far fa-edit"></i></a>
                        </td>
                    </tr>
                {/foreach}
            </tbody>
    </table>

    <div class="pages">
        {for $page=1 to $maxPages}
            <a href="listaEspecies?page={$page} ">{$page}</a>
        {/for}
    </div>

    {include file="templates/searchForm.tpl"}

    <section {if $user['rol'] != "adm"} class="hide" {/if}>
        <h2>Acceso administador - Alta</h2>
        <div class="formHome">
            <img id="arbol1" src="images/arbol.png">
            <form class="form" action="addSpecies" method="post">
                <input name="nombre_cientifico" type="text" placeholder="Nombre científico" required>
                <input name="nombre_comun" type="text" placeholder="Nombre común">
                <textarea name="descripcion" placeholder="Descripción"></textarea>
                <input name="estado_conservacion" type="text" placeholder="Estado de conservación">
                <select name="id_parque" required>
                    <option selected disabled>Área protegida</option>
                    {foreach from=$areas item=$area}
                        <option value="{$area->id_PN}"> {$area->nombre} </option>
                    {/foreach}
                </select>
                <input name="img" type="text" placeholder="Enlace a imagen" required>
                <input type="submit" value="Cargar">
            </form>
            <img id="arbol2" src="images/arbol.png">
        </div>
    </section>


</main>
{include file="templates/footer.tpl"}