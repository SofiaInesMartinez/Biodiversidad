"use strict"
const API_URL = "api/comentarios";

document.querySelector("#API_comment").addEventListener("submit", addComment);

let app = new Vue({
    el: "#app",
    data: {
        titulo: "Comentarios de nuestros visitantes",
        comments: [],
    },
}); 

async function getComments() {
    try {
        let response = await fetch(API_URL);
        let comments = await response.json();
        app.comments = comments;
    } catch (e) {
        console.log(e);
    }
}

async function addComment(e) { //FALTA HACER
    console.log("as");
    e.preventDefault();
    alert("Si te animás hace el POST via fetch ;)");
}

getComments();
