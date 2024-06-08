var tentativas = 0;
var NumAleatorio = Math.floor(Math.random() * 100) + 1;

function funcJogo() {
    tentativas = 0;
    NumAleatorio = Math.floor(Math.random() * 100) + 1;
    document.getElementById("palpite").value = '';
}

function jogo() {
    var palpite = parseInt(document.getElementById("palpite").value);
    tentativas++;

    if (palpite > NumAleatorio) {
        alert("Você errou na sua " + tentativas + "ª chance.");
        alert("Seu palpite é maior que o número sorteado.");
    } 
    else if (palpite < NumAleatorio) {
        alert("Você errou na sua " + tentativas + "ª chance.");
        alert("Seu palpite é menor que o número sorteado.");
    } 
    else {
        alert("PARABÉNS! Você acertou na sua " + tentativas + "ª chance. O número era " + NumAleatorio);
        funcJogo();
        return;
    }

    if (tentativas >= 3) {
        alert("Suas tentativas acabaram! O número era " + NumAleatorio);
        funcJogo();
    }
}