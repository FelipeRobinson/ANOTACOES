from random import randint
from os import system

system('cls')

vet = [randint(0, 20) for i in range(51)]

soma = sum(vet)

num9 = vet.count(9)

maior = max(vet)

positions = [i for i in range(len(vet)) if vet[i] == maior]

print(f"\n\n{vet}")
print(f"\n\tSoma dos valores do vetor: {soma}")
print(f"\n\tO número 9 aparece {num9} vezes no vetor")
print(f"\n\tO maior valor é {maior}")
print(f"\n\tO maior valor aparece nas posições {positions}")
