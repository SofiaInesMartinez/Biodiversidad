"use strict"
document.addEventListener('DOMContentLoaded', function() {
    let url = "api/usuario";

    let btnUpdate = document.querySelector("#btn-update");
    btnUpdate.addEventListener("click", updateRol);


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
    async function updateRol() {}

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