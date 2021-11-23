{include file="templates/header.tpl"}

<section>
    <h2>Acceso administador - Modificación</h2>
    <div class="formHome">
        <form class="form" action="updateAreaDB" method="post" enctype="multipart/form-data">
            <input name="id_PN" type="number" value="{$areas->id_PN}" hidden>
            <input name="nombre" type="text" placeholder="Nombre" value="{$areas->nombre}">
            <input name="region" type="text" placeholder="Region" value="{$areas->region}">
            <input name="ubicacion" type="text" placeholder="Ubicacion" value="{$areas->ubicacion}">
            <input name="anio_creacion" type="number" placeholder="Año de creación" value="{$areas->anio_creacion}">
            <input name="superficie" type="number" placeholder="Superficie (ha)" value="{$areas->superficie}">
            <input name="img" type="file" placeholder="Imagen" value="{$areas->img}">
            <input type="submit" value="Actualizar">
        </form>
    </div>
</section>


{include file="templates/footer.tpl"}