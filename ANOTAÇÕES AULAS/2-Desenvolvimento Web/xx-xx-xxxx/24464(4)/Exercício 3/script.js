const numLines = parseInt(prompt("Digite o número de linhas:"));

if (!isNaN(numLines) && numLines > 0) {
    const pyramidContainer = document.getElementById('pyramid');
    var pyramid = '';
    for (var i = numLines; i >= 1; i--) {
        var line = '';
        for (var j = 1; j <= i; j++) {
            line += (i < 10 ? '0' : '') + i + ' ';
        }
        pyramid += line.trim() + '\n';
    }
    alert(pyramid)
}
else {
    alert("Por favor, digite um número válido de linhas.");
}