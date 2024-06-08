function gerarPiramide() {
    var num = parseInt(document.getElementById('piramid').value);
    var resultado = '';

    for (var i = 1; i <= num;) {
        for (var j = 1; j <= i;) {
            var numeroFormatado = i.padStart(2, '0');
            resultado += numeroFormatado + ' ';
        }
    }
    alert(resultado);
}