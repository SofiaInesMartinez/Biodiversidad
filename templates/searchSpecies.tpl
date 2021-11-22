{include file="templates/header.tpl"}

<h1>Resultado de la búsqueda</h1>

<main>
    <table>
        <thead>
            <tr>
                <th>Nombre científico</th>
                <th>Nombre común</th>
                <th>Estado de conservación</th>
                <th>Área protegida</th>
            </tr>
            <thead>
            <tbody>
                {foreach from=$especies item=$especie}
                    <tr>
                        <td><i><a href='especies/{$especie->id_especie}'>{$especie->nombre_cientifico}</a></i></td>
                        <td>{$especie->nombre_comun}</td>
                        <td>{$especie->estado_conservacion}</td>
                        <td><a href="area/{$especie->id_parque}">{$especie->nombre}</a></td>
                    </tr>
                {/foreach}
            </tbody>
    </table>

    <div class="pages">
        <a href="listaEspecies">Volver</a>
    </div>

    {include file="templates/searchForm.tpl"}

</main>
{include file="templates/footer.tpl"}