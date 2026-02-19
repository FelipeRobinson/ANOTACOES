var tentativas = 3;

var num = Math.floor(Math.random() * 10);

function game() {

    var palpite = parseInt(document.getElementById("jogo").value);

    if (palpite === num) {
        alert("Parabéns! Você acertou o número.");
    return false;
        }
    else {
        alert("Tente novamente. Você errou o número.");
        tentativas--;
        alert("Você tem " + tentativas + " tentativas.");
    document.getElementById("jogo").value = "";

        if (tentativas == 0) {
            alert("Suas tentativas acabaram. \n\nO número correto era " + num + ".");
    return false;
            }
        else {
            document.getElementById("jogo").value = "";
            }
        }
}
