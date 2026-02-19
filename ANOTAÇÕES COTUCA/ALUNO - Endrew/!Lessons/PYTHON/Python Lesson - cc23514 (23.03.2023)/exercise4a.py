from os import system
from time import sleep

system('cls')

def phrase():
    frase = input("\n\n\tDigite uma frase\n\t==> ")
    new = ""
    
    while True:
        if frase == "":
            print("\n\n\tVocê precisa digitar uma frase!")
            sleep(2)
            system('cls')
            return phrase()
        else:
            for x in frase:
                if x != " ":
                    new += x
            print(f"\n\tA frase sem espaços fica\n\t==> {new}")
            break
phrase()