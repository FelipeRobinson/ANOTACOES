function game() {
    n = Math.floor(Math.random() * 9) + 1
    tent = 0

    alert("Você terá 3 chances para acertar o número!")

    while (tent < 3) {
        palpite = parseInt(prompt ("Digíte um número de 1 a 9"))

        if (isNaN(palpite) || palpite < 1 || palpite >= 9) {
            alert("Digíte um número de 1 a 1000!")
            continue
        }

        if (palpite == n) {
            alert("Você acertou em " + (tent + 1) + " tentativas")
            alert("O número da sorte era " + n)
            return
        }

        else if (palpite < n) {
            alert("O número sorteado é maior!")
        }

        else {
            alert ("O número sorteado é menor!")
        }

        tent++
    }

    alert("Poxa, você não acertou o número!")
    alert("O número era " + n)
}