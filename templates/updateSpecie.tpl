{include file="templates/header.tpl"}

<section>
    <h2>Acceso administador - Modificación</h2>
    <div class="formHome">
        <form class="ABMForm" action="updateSpeciesDB" method="post">
            <input name="id_especie" type="number" value="{$especies->id_especie}" hidden>
            <input name="nombre_cientifico" type="text" placeholder="Nombre científico" value="{$especies->nombre_cientifico}">
            <input name="nombre_comun" type="text" placeholder="Nombre común" value="{$especies->nombre_comun}">
            <textarea name="descripcion" placeholder="Descripción">{$especies->descripcion}</textarea>
            <input name="estado_conservacion" type="text" placeholder="Estado de conservación" value="{$especies->estado_conservacion}">
            <select name="id_parque">
                <option value="{$especies->id_parque}" selected>{$especies->nombre}</option>
                {foreach from=$areas item=$area}
                    <option value="{$area->id_parque}"> {$area->nombre} </option>
                {/foreach}
            </select>
            <input name="img" type="text" placeholder="Enlace a imagen" value="{$especies->img}">
            <input type="submit" value="Actualizar">
        </form>
    </div>
</section>


{include file="templates/footer.tpl"}