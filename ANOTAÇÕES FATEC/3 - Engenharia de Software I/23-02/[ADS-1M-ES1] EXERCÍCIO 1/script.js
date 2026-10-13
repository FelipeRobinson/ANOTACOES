/* 
// mesmo exercício



let numero = new Array(1000);

let maior = numero[0];

for (let i = 1; i < 1000; i++) {
    if (numero[i] > maior) {
        maior = numero[i];
    }
}

console.log(maior);

    Começamos assim: criamos uma variável (let) com um Array que contem 1000 valores
    dentro dele. Nesse array não consideramos se ele tem números certos, mas conside-
    ramos que ele contenha 1000 valores (posições) dentro dele. Em seguida, ditamos
    que o primeiro valor desse array é o maior, e comparamos esse primeiro valor se-
    lecionado com os outros. Caso encontre um valor maior que esse primeiro e assim
    por diante, elea passa a pegar esse valor como o escolhido. Caso ele não encontre
    mais valores maiores, ele nos mostra o valor selecionado como o maior.
*/

let numeros = []; // array começa vazio

function adicionarNumero(valor) {
    // Verifica se já tem 1000 valores
    if (numeros.length >= 1000) {
        console.log("Limite máximo de 1000 números atingido.");
        return;
    }

    // Verifica se é número inteiro
    if (!Number.isInteger(valor)) {
        console.log("Valor inválido! Apenas números inteiros são permitidos.");
        return;
    }

    numeros.push(valor);
}

// Função para encontrar o maior número
function encontrarMaior() {
    if (numeros.length === 0) {
        console.log("A lista está vazia.");
        return;
    }

    let maior = numeros[0];

    for (let i = 1; i < numeros.length; i++) {
        if (numeros[i] > maior) {
            maior = numeros[i];
        }
    }

    console.log("Maior número:", maior);
}