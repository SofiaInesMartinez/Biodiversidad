{include file="templates/header.tpl"}

<main>
    <h1>{$area->nombre}</h1>
    <h2>Región: {$area->region}</h2>
    <figure class="area">
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
    <section>
        <h2>Dejanos tu comentario </h2>
        <div class="formHome">
            <form class="form" action="addComment" method="POST">
                <textarea name="comment" required>¿Visitaste el parque? Queremos conocer tu opinión. </textarea>
                <div class="radio-toolbar">
                    <label for="score">Calificá el parque</label>
                    <div><input type="radio" name="score" value="1"><i class="far fa-star"></i></div>
                    <div><input type="radio" name="score" value="2"><i class="far fa-star"></i></div>
                    <div><input type="radio" name="score" value="3"><i class="far fa-star"></i></div>
                    <div><input type="radio" name="score" value="4"><i class="far fa-star"></i></div>
                    <div><input type="radio" name="score" value="5"><i class="far fa-star"></i></div>
                </div>
                <input type="submit" value="Enviar">
            </form>
        </div>
    </section>

</main>

{include file="templates/footer.tpl"}