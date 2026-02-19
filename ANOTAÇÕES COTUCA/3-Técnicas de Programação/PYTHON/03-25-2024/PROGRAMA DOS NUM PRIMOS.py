print("PROGRAMA DOS NÚMEROS PRIMOS")

def eh_primo(numero):
    if numero <= 1:
        return False
    for divisor in range(2, int(numero**0.5) + 1):
        if numero % divisor == 0:
            return False
    return True

limite_inferior = int(input("Digite o limite inferior do intervalo: "))
limite_superior = int(input("Digite o limite superior do intervalo: "))

print(f"Números primos no intervalo de {limite_inferior} a {limite_superior}:")
for numero in range(limite_inferior, limite_superior + 1):
    if eh_primo(numero):
        print(numero)