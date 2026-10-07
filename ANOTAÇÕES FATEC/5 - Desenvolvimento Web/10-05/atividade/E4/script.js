btIniciar = document.getElementById("iniciar");
btLimpar = document.getElementById("limpar");
exResultados = document.getElementById("resultados");

btIniciar.addEventListener("click", function () {
    if (exResultados.childElementCount > 0) {
        alert("Os dados já foram lançados. Use Limpar para fazer outro lançamento.");
        return;
    }

    const quantidade = Number(document.getElementById("quantidade").value);
    const contagem = [0, 0, 0, 0, 0, 0];

    for (let i = 0; i < quantidade; i++) {
        const numero = Math.floor(Math.random() * 6) + 1;
        contagem[numero - 1]++;
        const img = document.createElement("img");
        img.src = "./img/dado" + numero + ".jpg";
        exResultados.appendChild(img);
    }

    const relatorio = document.getElementById("relatorio");

    let html = "Foram lançados " + quantidade + " dados.<br>";
    for (let l = 1; l <= 6; l++) {
        const vezes = contagem[l - 1];
        const pct = (vezes / quantidade * 100).toFixed(1);
        html += "Lado " + l + ": " + vezes + " vez(es) (" + pct + "%)<br>";
    }
    relatorio.innerHTML = html;
});

btLimpar.addEventListener("click", function(){
    exResultados.innerHTML = "";
    document.getElementById("relatorio").innerHTML = "";
});