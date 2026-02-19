function game() {
    n = Math.floor(Math.random() * 1000) + 1
    tent = 0

    name = prompt ("Digíte seu nome!")
    if (name == null || name.trim() === '') {
        alert("Você precisa digitar seu nome!")
        return
    }

    alert("Você terá 3 chances para acertar o número!")

    while (tent < 3) {
        palpite = parseInt(prompt ("Digíte um número de 1 a 1000"))

        if (isNaN(palpite) || palpite <1 || palpite > 1000) {
            alert("Digíte um número de 1 a 1000!")
            continue
        }

        if (palpite == n) {
            alert ("Parabéns " + (name) + ", você acertou!")
            alert("Você acertou em " + (tent + 1) + " tentativas")
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

    alert("Poxa " + name + ", você não acertou o número!")
    alert("O número era " + n)
}