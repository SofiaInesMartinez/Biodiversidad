{include file="templates/header.tpl"}

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