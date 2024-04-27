from os import system
from time import sleep

system('cls')

def phrase():
    palavra = input("\n\n\tDigite uma palavra\n\t==> ")
    invert = ""
    
    while True:
        if palavra == "":
            print("\n\n\tVocê precisa digitar uma palavra!")
            sleep(2)
            system('cls')
            return phrase()
        else:
            for x in palavra:
                invert = palavra[::-1]
            print(f"\n\tA palavra invertida fica\n\t==> {invert}")
            break
    if invert == palavra:
        print ("\n\n\tÉ um palíndromo!")
        
    else:
        print ("\n\n\tNão é um palíndromo!")
phrase()