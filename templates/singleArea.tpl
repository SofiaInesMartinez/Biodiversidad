{include file="templates/header.tpl"}
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>

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

    <section id="comments-list">
        {include file='templates/vue/commentsList.tpl'}
    </section>


    <section {if ($id_user == "")} class="hide" {/if}>
        <h2>Dejanos tu comentario </h2>
        <div class="formHome">
            <form class="form" id="API_comment" action="addComment" method="POST">
                <label>¿Visitaste el parque? Queremos conocer tu opinión. </label>
                <textarea name="comment" required></textarea>
                <div class="radio-toolbar">
                    <label for="score">Calificá el parque</label>
                    <div><input type="radio" name="score" value="1" required></div>
                    <div><input type="radio" name="score" value="2"></div>
                    <div><input type="radio" name="score" value="3"></div>
                    <div><input type="radio" name="score" value="4"></div>
                    <div><input type="radio" name="score" value="5"></div>
                </div>
                <input type="hidden" name="id_usuario" value="{$id_user}">
                <input type="hidden" name="id_PN" value="{$area->id_PN}" id="id_PN">
                <input type="submit" value="Enviar" id="btn-add">
            </form>
        </div>
    </section>

</main>


<script src="./js/app.js"></script>
{include file="templates/footer.tpl"}