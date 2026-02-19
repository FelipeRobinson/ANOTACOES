from os import system
from time import sleep

system('cls')

vet = []

maior = 0
par = 0
impar = 0
n_vet = 0

while True:
    try:
        print("\n\n\tDigite um número negativo para somar os números (EX: -1)")
        initial = int(input("\n\tDigite um número inteiro quantas vezes quiser: "))
    except ValueError as err:
        print("\n\tDigíte um Número inteiro!\n\n")
        sleep(2)
        system('cls')
        continue
    
    sleep(0.5)
    system('cls')
    
    if initial < 0:
        break

    vet.append(initial)

    n_vet += 1

    if initial > 5:
        maior += 1

    if initial % 2 == 0:
        par += initial
    else:
        impar += initial

print(f"\n\t{vet}")
print(f"\n\tNúmeros maiores que 5: {maior}")
print(f"\n\tSoma de números pares: {par}")
print(f"\n\tSoma de números ímpares: {impar}")
print(f"\n\tNúmeros escritos: {n_vet}")