from random import randint
from os import system

system('cls')

vet = [randint(0, 20) for i in range(11)]

print("\n\n\tOriginal:", vet)

vet.insert(0, vet.pop())

print("\n\tManipulado:", vet)

