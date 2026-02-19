function exercicio1(frmExemplo1) {
    var nome = document.getElementById("nome");
    nome.style.background = "#00000000";
    nome.style.color = "#FFFFFF";
    nome.style.border = "4px solid #BB00FF";
    nome.style.fontSize = "20px";

    var idade = document.getElementById("idade");
    idade.style.background = "#000080";
    idade.style.color = "#FFFFFF"; // Adicionando cor para garantir legibilidade
    idade.style.border = "2px solid #FF8C00";
    idade.style.fontSize = "30px";

    var time = document.getElementById("time");
    time.style.background = "#00FF00";
    time.style.color = "#000000"; // Adicionando cor para garantir legibilidade
    time.style.border = "8px solid #BB00FF";
    time.style.fontSize = "40px";

    return false; // Para prevenir o envio do formulário
}