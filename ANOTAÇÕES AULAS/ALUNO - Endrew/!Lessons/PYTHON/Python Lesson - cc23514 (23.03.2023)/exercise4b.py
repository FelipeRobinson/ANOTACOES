from os import system
from time import sleep

system('cls')

def cont(frase):
    contador = 0
    for p in frase.split():
        contador += 1
    return contador

frase = input ("\n\n\tEscreva uma frase\n\t==> ")
contar = cont(frase)
print(f"\n\n\tTem {contar} palavras nessa frase")
sleep(3)
system ('cls')