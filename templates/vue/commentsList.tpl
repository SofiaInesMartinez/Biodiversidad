{literal}
    <section id="app1">
        <h2> {{titulo}} </h2>
        <ul v-for="comment in comments" class="comment">
            <li>{{comment.comment}} | {{comment.score}} <i class="far fa-star"></i></li>
            <li>{{comment.nombre}}</li>
            <span v-if="user == 'adm'">
                    <a v-on:click="eliminar"><i v-bind:id="`${comment.id_comment}`" class="far fa-trash-alt"></i></a>
            </span>
        </ul>
    </section>
{/literal}