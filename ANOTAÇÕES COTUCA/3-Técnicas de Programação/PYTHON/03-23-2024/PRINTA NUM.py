print("EXERCÍCIO 58 - LISTA 3")

while True:
    numero=int(input("\nDigite um número natural: "))

    if numero < 1:
        print("\nnão é possível com um número menor que zero")

    else:
        break

for i in range(numero):
    print(numero*[numero])