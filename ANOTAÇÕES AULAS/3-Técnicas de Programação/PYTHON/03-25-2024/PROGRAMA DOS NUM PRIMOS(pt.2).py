def encontrar_primos(limite_inferior, limite_superior):
    # Inicializando uma lista para marcar se um número é primo ou não
    # Inicialmente, consideramos todos os números como primos
    primos = [True] * (limite_superior + 1)

    # Marcar 0 e 1 como não primos
    primos[0] = primos[1] = False

    # Aplicar o Crivo de Eratóstenes para marcar os múltiplos dos números primos como não primos
    for numero in range(2, int(limite_superior**0.5) + 1):
        if primos[numero]:
            for multiplo in range(numero * numero, limite_superior + 1, numero):
                primos[multiplo] = False

    # Retornar uma lista dos números primos dentro do intervalo especificado
    numeros_primos = [numero for numero in range(limite_inferior, limite_superior + 1) if primos[numero]]
    return numeros_primos

limite_inferior = int(input("Digite o limite inferior do intervalo: "))
limite_superior = int(input("Digite o limite superior do intervalo: "))

primos_no_intervalo = encontrar_primos(limite_inferior, limite_superior)

print(f"Números primos no intervalo de {limite_inferior} a {limite_superior}:")
for primo in primos_no_intervalo:
    print(primo)
