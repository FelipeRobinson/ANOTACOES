document.getElementById("btn2").style.display = 'none';

function criarPiramide() {

    var lines = parseInt(prompt("Digíte a quantidade de linhas:"));

    var output = "";

    document.getElementById("btn").style.display = "none";

    for (var i = lines; i >= 1; i--) {
        for (var j = 1; j <= i; j++) {
            output += ("0" + i).slice(-2) + " ";
        }
        output += "<br>";
    }

    document.getElementById("pyramid").innerHTML = output;

    document.getElementById("btn2").style.display = 'block';

}