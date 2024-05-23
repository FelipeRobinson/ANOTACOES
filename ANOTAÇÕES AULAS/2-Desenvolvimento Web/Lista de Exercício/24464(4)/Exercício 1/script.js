function calcularNum() {
    let num1 = parseInt(document.forms["frmDados"]["num1"].value);
    let num2 = parseInt(document.forms["frmDados"]["num2"].value);

    if (!isNaN(num1) && !isNaN(num2)) {
        let q = Math.floor(num1 / num2);
        alert("A) " + (num1 + num2));
        alert("B) " + (num1 - num2));
        alert("C) " + (num2 - num1));
        alert("D) " + (num1 * num2));
        alert("E) " + (num1 / num2));
        alert("F) " + q);
        alert("G) " + (num1 % num2));
    } else {
        alert("Os valores digitados devem ser números válidos.");
    }
}