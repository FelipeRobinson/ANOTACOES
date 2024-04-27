function number1() {
    n1 = parseFloat(prompt("Digite um número"));
    if (!n1) {
        alert("Digite apenas números!");
        number1()
        }
    }

function number2() {
    n2 = parseFloat(prompt("Digite outro número"));
    if (!n2) {
        alert("Digite apenas números!");
        number2()
        }
    else {
            soma = n1 + n2
            alert(n1 + " + " +  n2 + " = " + soma)
            }

    }