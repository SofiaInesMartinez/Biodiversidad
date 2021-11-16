"use strict"
let url = "api/comentarios";

let formComment = document.querySelector("#API_comment");
formComment.addEventListener("submit", function (e) {
    e.preventDefault();
});

/* let deleteBtn = document.querySelectorAll(".delete");
deleteBtn.addEventListener("click", function () {
    deleteComment();
    getCommentsByArea();
}); */

/* let btnAdd = document.querySelector("#btn-add");
btnAdd.addEventListener("click", addComment); */

let idPN = document.getElementById("id_PN").value;

let app = new Vue({
    el: "#app",
    data: {
        titulo: "Comentarios de nuestros visitantes",
        comments: [],
    },
});

async function getCommentsByArea() {
    try {
        let response = await fetch(`${url}?id_PN=${idPN}`);
        let comments = await response.json();
        app.comments = comments;
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

/* function deleteComment(id) {
    try {
        let response = await fetch(`${url}/${id}`, {
            "method": 'DELETE',
            "headers": { 'Content-Type': 'application/json' },
        });
        if (response.ok) {
            console.log("Eliminado");
            //msg.innerHTML = "Eliminado!";
            getCommentsByArea();
        }
    } catch (error) {
        console.log(error);
    }
}
 */
getCommentsByArea();
