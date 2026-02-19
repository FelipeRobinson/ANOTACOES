const express = require("express");
const aplicacao = express();
const porta = 3000;

aplicacao.get("/home", (req, res) => {
    res.send("<h1>Home Page</h1>");
});

aplicacao.listen(porta, () => console.log("Servidor Ativo."));