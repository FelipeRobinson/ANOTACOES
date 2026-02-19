var http = require('http')

var fs = require('fs')
var caminhoArquivo = 'Z:\\NODEJS_2024\\index.html';

http.createServer((request,response) => /*o nome do => é fat arrow*/ {
    // quando o server que mandar algo pro browser = response
    // quando o browser que mandar algo pro server = request
    // response.end("<h1>Minha 1o pagina no NODE JS</h1>")

    /*
    if(request.url == "/ola") {
        response.end("./")
    }
    if(request.url == "/hasta_la_vista_baby") {
        response.end("<h1>NODE_JS diz: Tchau pra tu troxa!!!</h1>")
    }
    */

    response.writeHead(200, {'content-type': 'text/html'});
    fs.createReadStream(caminhoArquivo).pipe(response);
}).listen(3000, () => console.log("Servidor Funcionando!"))

/* 
FORMAS DE FAZER UMA FUNÇÃO:

function soma(a,b) {
    // declaração de fonte estática PADRÃO
}

var media = function(a,b) {
    // cria a função genércia associada a uma variável
}

var soma = (a,b) => { a,b; }
    // => é igual a 'function' (não precisa mais do return, por causa do fat arrow(=>))
*/