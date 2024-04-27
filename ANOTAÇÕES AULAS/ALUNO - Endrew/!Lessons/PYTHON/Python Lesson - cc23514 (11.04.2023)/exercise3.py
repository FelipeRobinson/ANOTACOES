from random import randint
from os import system

system('cls')

n = int (input ("\n\n\tDigite o número máximo: "))

vet = [randint(0, n) for i in range(5)]

invert = vet[::-1]

print(f"\n\n\tNormal ==> {vet}")
print(f"\n\tInvertido ==> {invert}")