function conferirDivisores(n) {
    let soma = 0;
    for (let i = 1; i <= Math.floor(n / 2); i++) { // Corrigido para até n / 2
        if (n % i === 0) {
            soma += i;
        }
    }
    return soma;
}

function verificacao(num1, num2) {
    const somar_num1 = conferirDivisores(num1);
    const somar_num2 = conferirDivisores(num2);

    return somar_num1 === num2 && somar_num2 === num1;
}

function conferirAmigos() {
    const num1 = parseInt(document.getElementById('num1').value);
    const num2 = parseInt(document.getElementById('num2').value);

    if (isNaN(num1) || isNaN(num2)) {
        alert("Coloca algum bagulho nos campos antes brow!!!");
        return; // Sai da função se os campos estiverem vazios
    }

    if (num1 === num2) {
        alert("Tu tbm tá de tiração né...");
        alert("Os números são iguais babaca!");
        return;
    }

    if (verificacao(num1, num2)) {
        alert("Os números são amigos sim (mas te odeia por ter que fazer essa conta)");
    } 
    
    else {
        alert("Os números não são amigos (amém)");
    }
}
