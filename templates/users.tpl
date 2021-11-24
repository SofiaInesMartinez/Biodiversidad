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
        <tbody>
            {foreach from=$users item=$user}
                <tr>
                    <td>{$user->id_usuario}</td>
                    <td>{$user->mail}</td>
                    <td>{$user->rol}</td>
                    <td>
                        <a title="Eliminar" href="deleteUser/{$user->id_usuario}"><i class="far fa-trash-alt"></i></a>
                    </td>
                </tr>
            {/foreach}
        </tbody>
    </table>
    
    <section>
        <h2>Cambiar permiso de usuario:</h2>
        <div class="formRol">
            <form class="form" action="updateUser" method="POST">
                <input value="" type="number" name="id" placeholder="ID" required/>
                <select name="rol" required>
                    <option value="adm">adm</option>
                    <option value="user">user</option>
                </select>
                <input type="submit" value="Cambiar"/>
            </form>
        </div>
    </section>
</main>

{include file="templates/footer.tpl"}