{literal}
    <tbody id="app1">
        <tr v-for="user in users">
            <td>{{user.id_usuario}}</td>
            <td>{{user.mail}}</td>
            <td>{{user.rol}}</td>
            <td><a v-on:click="eliminar"><i v-bind:id="`${user.id_usuario}`" class="far fa-trash-alt"></i></a></td>
        </tr>
    </tbody>
{/literal}