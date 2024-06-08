var tentativas = 0

function jogo() {
    var NumAleatorio = Math.floor(Math.random() * 100);
    var palpite = document.getElementById("palpite")
    while (palpite == NumAleatorio) {
        if (palpite > NumAleatorio) {
            alert("O seu palpite é maior que o número sorteado.")
            tentativas+=
        }
        if(palpite < NumAleatorio) {
            alert("Seu palpite é menor que o número sorteado.")
            tentativas+=
        }
        if (palpite == NumAleatorio) {
            alert("PARABÉNS! Você acertou na chance " + tentativas + ". O número era " + NumAleatorio)
        }        
    }
}