var http = require('http');

http.createServer((req,res) => {
    res.end("<h1>Funcionando...</h1>")
}).listen(3000, () => console.log("Servidor Funcionando!"))