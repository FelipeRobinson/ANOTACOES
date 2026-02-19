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
            sub1 = n1 - n2
            sub2 = n2 - n1
            mult = n1 * n2
            div = n1 / n2
            div1 = Math.floor(n1 / n2)
            rest = n1 % n2

            alert(`A soma de ${n1} + ${n2} = ${soma}
                \nA subtração de ${n1} - ${n2} = ${sub1}
                \nA subtração de ${n2} - ${n1} = ${sub2}
                \nA multiplicação de ${n1} x ${n2} = ${mult}
                \nA divisão de ${n1} ÷ ${n2} = ${div}
                \nO quociente de ${n1} ÷ ${n2} = ${div1}
                \nO resto de ${n1} ÷ ${n2} = ${rest}
            `)
        }
    }