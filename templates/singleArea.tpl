{include file="templates/header.tpl"}

<main>
    <h1>{$area->nombre}</h1>
    <h2>Región: {$area->region}</h2>
    <figure>
        <img src="{$area->img}">
        <div>
            <p>Ubicación: {$area->ubicacion}</p>
            <p>Año de creación: {$area->anio_creacion}</p>
            <p>Superficie: {$area->superficie} ha</p>
            <p>
                <a href='especiesDelParque/{$area->id_PN}'>Ver especies del Parque</a>
            </p>
        </div>
    </figure>

</main>

{include file="templates/footer.tpl"}