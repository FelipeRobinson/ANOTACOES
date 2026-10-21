d0.addEventListener('click', function() { digito('0');});
d1.addEventListener('click', function() { digito('1');});
d2.addEventListener('click', function() { digito('2');});
d3.addEventListener('click', function() { digito('3');});
d4.addEventListener('click', function() { digito('4');});
d5.addEventListener('click', function() { digito('5');});
d6.addEventListener('click', function() { digito('6');});
d7.addEventListener('click', function() { digito('7');});
d8.addEventListener('click', function() { digito('8');});
d9.addEventListener('click', function() { digito('9');});
div.addEventListener('click', function() { operacao("/");});
mul.addEventListener('click', function() { operacao("X");});
sub.addEventListener('click', function() { operacao("-");});
adi.addEventListener('click', function() { operacao("+");});
off.addEventListener('click', retornar);
lim.addEventListener('click', limpar);
sep.addEventListener('click', separador);
tot.addEventListener('click', total);

function string2Number(valor) {
    valor = valor.replace(",", ".");
    return(parseFloat(valor));
}

function number2String(valor) {
    valor = valor.toString().replace('.', ',');
    return (valor);
}
function digito(dig) {
    if (res.value.length < 12) {
        if (res.value != "0")
            res.value = res.value + dig;
        else
            res.value = dig;
  }
}

function total() {
    let n1 = string2Number(v1.value);
    let n2 = string2Number(res.value);
    var result;
    if (op.value === "+")
        result = n1 + n2;
        res.value = number2String(n1 + " + " + n2 + " = " + result);
    else if (op.value === "-")
        result = n1 - n2;
        res.value = number2String(n1 + " - " + n2 + " = " + result);
    else if (op.value === "X")
        result = n1 * n2;
        res.value = number2String(n1 + " * " + n2 + " = " + result);
    else if (op.value === "/") {
        if (res.value !== 0)
            result = n1 / n2;
            res.value = number2String(n1 + " / " + n2 + " = " + result);
        else
            res.value = "Erro!";
    }
}

function operacao(ope) {
    v1.value = res.value;
    op.value = ope;
    res.value = "0";
}

function separador() {
    if (res.value.indexOf(",") < 0)
        res.value = res.value + ",";
}

function limpar() {
    res.value = "0";
}

function retornar() {
}