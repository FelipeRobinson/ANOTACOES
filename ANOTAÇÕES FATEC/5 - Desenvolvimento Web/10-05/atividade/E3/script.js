// Pegando os elementos do HTML
const numSort = document.getElementById("numSort");
const numJogos = document.getElementById("numJogos");
const btnGerar = document.getElementById("btnGerar");
const resultado = document.getElementById("resultado");

btnGerar.addEventListener("click", function () {
    const quantidadeNumeros = Number(numSort.value);
    const quantidadeJogos = Number(numJogos.value);
    // Limpando o resultado anterior
    resultado.innerHTML = "";

    // Repetição para criar a quantidade de jogos escolhida
    for (let jogo = 1; jogo <= quantidadeJogos; jogo++) {
        let numeros = [];

        // Enquanto não tivermos a quantidade de números desejada
        while (numeros.length < quantidadeNumeros) {
            let numero = Math.floor(Math.random() * 60) + 1;
            if (!numeros.includes(numero)) {
                numeros.push(numero);
            }
        }

        // Coloca os números em ordem crescente
        numeros.sort(function (a, b) {
            return a - b;
        });

        const jogoElemento = document.createElement("p");

        // Monta o texto do jogo 
        jogoElemento.textContent = 'Jogo ' + jogo + ': ' + numeros.join(' - ');

        // Adiciona o jogo na seção de resultado 
        resultado.appendChild(jogoElemento);
    }
});