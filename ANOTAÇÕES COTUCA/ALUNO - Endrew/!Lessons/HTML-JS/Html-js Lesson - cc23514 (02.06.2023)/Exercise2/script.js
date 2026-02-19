function calc() {
    inicial = parseFloat(document.getElementById('inicial').value)
    taxa = parseFloat(document.getElementById('taxa').value)
    time = parseFloat(document.getElementById('time').value)

    result = inicial * (1 + taxa / 100) ** time

    alert("O investimento é de R$" + result.toFixed(2))
}