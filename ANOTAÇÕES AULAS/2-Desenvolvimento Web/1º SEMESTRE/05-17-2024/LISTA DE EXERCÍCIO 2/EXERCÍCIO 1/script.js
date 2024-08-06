function exibeOpcoes() {
    document.write("Escolha uma letra: <input type='text' id='escolhido'>");
    document.write("<p id='a'>a) Técnicas de Programação</p>");
    document.write("<p id='b'>b) Desenvolvimento internet</p>");
    document.write("<p id='c'>c) Redes de Computadores</p>");
    document.write("<p id='d'>d) Engenharia de Sistemas</p>");
    document.write("<button name='botao' onclick='validaOpcao();'>Enviando DADOS</button>");
    document.write("<button name='botao' onclick='Limpaopcao();'>Limpar caixas</button>");
}

function Limpaopcao() {
    let opcao = document.getElementById("campoEntrada");
    alternativa.style.color = "#000";
    alternativa.style.fontFamily = "Times New Roman";
    alternativa.style.fontSize = "20px"
}

function validaOpcao() {
    let opcao = document.getElementById("escolhido");
    // para pegar o conteudo da variavel opcao que foi pega pelo getElementById faz-se: opcao.value
    // o switch-case, é como se o switch fosse um if e o case fosse os varios elif
    switch (opcao.value) {
        case "a":
        alternativa = document.getElementById("a");
        break;
        case "A":
        alternativa = document.getElementById("a");
        break;
        case "b":
        alternativa = document.getElementById("b");
        break;
        case "B":
        alternativa = document.getElementById("b");
        break;
        case "c":
        alternativa = document.getElementById("c");
        break;
        case "C":
        alternativa = document.getElementById("c");
        break;
        case "d":
        alternativa = document.getElementById("d");
        break;
        case "D":
        alternativa = document.getElementById("d");
        break;
        default:
        alert("Opção inválida! Tente uma correta!");
        break;
    }
    alternativa.style.color = "#Ff0000";
    alternativa.style.fontFamily = "Tahoma";
    alternativa.style.fontSize = "20px";
}

function init() {
    exibeOpcoes();
}

window.onload = init;