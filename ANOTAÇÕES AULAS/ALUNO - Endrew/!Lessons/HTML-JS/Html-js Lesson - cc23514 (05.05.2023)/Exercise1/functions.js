function name() {
    nome = prompt("Qual o seu nome?");
    return nome;
}

function yearnow() {
    year = prompt("Qual a sua idade?");
    return year;
}

function nick() {
    nome = name();
    if (!nome) {
        alert("Digite seu nome!");
        nick();
        }
    else {
        resposta = confirm("Está correto?");
        if (resposta) {
            alert("Olá " + nome + ", Seja bem vindo(a)!");
            }
        else {
            nick();
        }
    }
}

function idade() {
    year = yearnow()
    if (!year) {
        alert("Digite sua idade!");
        idade();
        }
    else {
        if (isNaN(parseInt(year))) {
            alert("Digite apenas números!");
            idade();
            }
        else {
            resposta = confirm("Está correto?");
            if (resposta) {
                if (year >= 18) {
                    alert("Boa " + nome + ", você tem " + year + " anos. Já maior de idade!");
                    document.write(nome + ", você é maior de idade!")
                    document.close()
                } else {
                    alert("Poxa " + nome + ", você tem " + year + " anos. Ainda é menor de idade!");
                    document.write(nome + ", você é menor de idade!")
                    document.close()
                }
            } else {
                idade();
            }
        }
    }
}