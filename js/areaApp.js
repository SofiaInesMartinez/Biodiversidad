"use strict"
document.addEventListener('DOMContentLoaded', function() {
    let idPN = document.getElementById("id_PN").value;
    let url = `api/${idPN}/comentarios`;

    let formComment = document.querySelector("#API_comment");
    formComment.addEventListener("submit", function(e) {
        e.preventDefault();
    });

    let scoreForm = document.querySelector("#scoreForm");
    scoreForm.addEventListener("submit", function(e) {
        e.preventDefault();
    });

    let btnAdd = document.querySelector("#btn-add");
    btnAdd.addEventListener("click", addComment);

    let btnFiltro = document.querySelector("#btn-filtro");
    btnFiltro.addEventListener("click", getCommentsByScore);

    let btnAll = document.querySelector("#btn-all");
    btnAll.addEventListener("click", getCommentsByArea);


    let app1 = new Vue({
        el: "#app1",
        data: {
            titulo: "Comentarios de nuestros visitantes",
            comments: [],
            user: ""
        },
        methods: {
            eliminar: function(event) {
                deleteComment(event.target.id)
            }
        }
    });

    function getUserRol() {
        let commentsForm = document.getElementById('commentsForm');
        app1.user = commentsForm.dataset.user
    }

    async function getCommentsByArea() {

        try {
            let response = await fetch(url);
            let comments = await response.json();
            app1.comments = comments;
        } catch (e) {
            console.log(e);
        }
    }

    function getScore() {
        let formData = new FormData(scoreForm);
        let score = formData.get("score");
        return score;
    }
    async function getCommentsByScore() {
        let score = getScore();
        try {
            let response = await fetch(`${url}/${score}`);
            let comments = await response.json();
            app1.comments = comments;
        } catch (e) {
            console.log(e);
        }
    }

    async function addComment() {
        let newComment = commentData();
        try {
            let response = await fetch(url, {
                "method": "POST",
                "headers": {
                    'Content-Type': 'application/json'
                },
                "body": JSON.stringify(newComment),
            });
            if (response.ok) {
                console.log("Comentario creado");
            }
        } catch (response) {
            console.log("Error de conexion");
        }
        getCommentsByArea();
    }

    function commentData() {
        let formData = new FormData(formComment);
        let comment = formData.get("comment");
        let score = Number(formData.get("score"));
        let idUsuario = Number(formData.get("id_usuario"));
        let idPN = Number(formData.get("id_PN"));
        if (comment != '' && score != 0) {
            let newComment = {
                "comment": comment,
                "score": score,
                "id_PN": idPN,
                "id_usuario": idUsuario,
            }
            formComment.reset();
            return newComment;
        }
    }


    async function deleteComment(idComment) {
        try {
            let response = await fetch(`${url}/${idComment}`, {
                "method": "DELETE",
                "headers": {
                    'Content-Type': 'application/json'
                },
            });
            if (response.ok) {
                console.log("Eliminado");
            }
        } catch (error) {
            console.log(error);
        }
        getCommentsByArea();
    }

    getCommentsByArea();
    getUserRol();
})