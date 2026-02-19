from os import system
from time import sleep

system('cls')

def phrase():
    frase = input("\n\n\tDigite uma frase\n\t==> ")
    invert = ""
    
    while True:
        if frase == "":
            print("\n\n\tVocê precisa digitar uma frase!")
            sleep(2)
            system('cls')
            return phrase()
        else:
            for x in frase:
                invert = frase[::-1]
            print(f"\n\tA frase invertida fica\n\t==> {invert}")
            break
phrase()