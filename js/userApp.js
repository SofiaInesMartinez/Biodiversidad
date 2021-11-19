"use strict"
document.addEventListener('DOMContentLoaded', function() {
    let url = "api/usuario";

    let btnUpdate = document.querySelector("#btn-update");
    btnUpdate.addEventListener("click", updateUser);


    let app1 = new Vue({
        el: "#app1",
        data: {
            users: []
        },
        methods: {
            eliminar: function(event) {
                deleteUser(event.target.id)
            }
        }
    });

    async function getUsers() {
        try {
            let response = await fetch(`${url}`);
            let users = await response.json();
            app1.users = users;
        } catch (e) {
            console.log(e);
        }
    }
    let userForm = document.querySelector("#userForm");
    userForm.addEventListener("submit", function(e) {
        e.preventDefault();
    });

    function rolData() {
        let formData = new FormData(userForm);
        let id = formData.get("id");
        let rol = formData.get("rol");
        if (id) {
            let newUserData = {
                "id_usuario": id,
                "rol": rol,
            }
            userForm.reset();
            return newUserData;
        }
    }
    async function updateUser() {
        let editedRol = rolData();
        try {
            let res = await fetch(`${url}/${editedRol.id_usuario}`, {
                "method": "PUT",
                "headers": { 'Content-Type': 'application/json' },
                "body": JSON.stringify(editedRol)
            });
            if (res.status == 200) {
                console.log("editado correctamente");
            } else {
                console.log(res.status);
            }
        } catch (error) {
            console.log(error);
        }
        getUsers();
    }

    async function deleteUser(idUsuario) {
        try {
            let response = await fetch(`${url}/${idUsuario}`, {
                "method": "DELETE"
            });
            if (response.status == 200) {
                console.log('eliminado exitosamente');
            } else {
                console.log(response.status);
            }
        } catch (error) {
            console.log(error);
        }
        getUsers();
    }

    getUsers();
})