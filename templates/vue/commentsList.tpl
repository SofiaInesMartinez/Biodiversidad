{literal}
    <section id="app">
        <h2> {{titulo}} </h2>
        <ul v-for="comment in comments" class="comment">
            <li>{{comment.comment}} | {{comment.score}} <i class="far fa-star"></i></li>
            <li>{{comment.nombre}}</li>
            <li class="hide delete"><a title="Eliminar" v-bind:href="'comentarios/'+comment.id_comment"><i class="far fa-trash-alt"></i></a> </li>
        </ul>
    </section>
{/literal}
