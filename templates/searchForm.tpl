<section>
    <div class="formHome">
        <form class="form" action="searchSpecies" method="GET">
            <label> Búsqueda avanzada </label>
            <input name="nombre_cientifico" type="text" placeholder="Nombre científico o parte de él">
            <input name="nombre_comun" type="text" placeholder="Nombre común o parte de él">
            <select name="estado_conservacion">
                <option selected disabled>Estado de conservación</option>
                {foreach from=$estados item=$estado}
                    <option value="{$estado}"> {$estado} </option>
                {/foreach}
            </select>
            <input type="submit" value="Buscar">
        </form>
    </div>
</section>