function calcularNum(frmDados) {
    num1 = parseInt(frmDados.txt_Num1.value)
    num2 = parseInt(frmDados.txt_Num2.value)
    let opcao = document.getElementById("escolhido")
    switch (opcao.value) {
        case "a":
            alert(num1 + num2)
            break;
        case "b":
            alert(num1 - num2)
            break;
        case "c":
            alert(num2 - num1)
            break;
        case "d":
            alert(num1 * num2)
            break;
        case "e":
            alert(num1 / num2)
            break;
        case "f":
            alert(num2 / num1)
            break;
        case "g":
            alert(num1 % num2)
            break;
    }
}