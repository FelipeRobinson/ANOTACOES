function calcularNum() {
    let num1 = parseInt(document.forms["frmDados"]["num1"].value);
    let num2 = parseInt(document.forms["frmDados"]["num2"].value);

    if (!isNaN(num1) && !isNaN(num2)) {
        let q = Math.floor(num1 / num2);
        alert("a) " + (num1 + num2));
        alert("b) " + (num1 - num2));
        alert("c) " + (num2 - num1));
        alert("d) " + (num1 * num2));
        alert("e) " + (num1 / num2));
        alert("f) " + q);
        alert("g) " + (num1 % num2));
    } else {
        alert("Os valores digitados devem ser números válidos.");
    }
}