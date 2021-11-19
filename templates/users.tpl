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
        <div class="formRol">
            <form class="form" action="updateUser" id="userForm">
                <input value="" type="number" name="id" placeholder="ID" required/>
                <select name="rol" required>
                    <option value="adm">adm</option>
                    <option value="user">user</option>
                </select>
                <input type="submit" value="Cambiar" id="btn-update"/>
            </form>
        </div>
    </section>
</main>
<script src="./js/userApp.js"></script>
{include file="templates/footer.tpl"}