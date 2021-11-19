{include file="templates/header.tpl"}

<h1>Usuarios:</h1>

<main>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>MAIL</th>
                <th>ROL</th>
                <th></th>
            </tr>
        <thead>
        {include file="templates/vue/usersList.tpl"}
    </table>
    
    <section>
        <h2>Cambiar permiso de usuario:</h2>
        <div class="formHome">
            <img id="arbol1" src="images/arbol.png">
            <form class="form" action="api/usuario" method="post">
                <select name="id_usuario" required>
                    {foreach from=$users item=$user}
                        <option value="{$user->id_usuario}"> {$user->id_usuario} </option>
                    {/foreach}
                </select>
                <select name="rol" required>
                    <option value="adm">adm</option>
                    <option value="user">user</option>
                </select>
                <button type="submit" id="btn-update">Cambiar</button>
            </form>
            <img id="arbol2" src="images/arbol.png">
        </div>
    </section>
</main>
<script src="./js/userApp.js"></script>
{include file="templates/footer.tpl"}