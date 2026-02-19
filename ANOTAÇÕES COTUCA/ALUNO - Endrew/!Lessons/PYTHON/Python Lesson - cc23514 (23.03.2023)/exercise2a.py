from os import system
from time import sleep

system('cls')

def phrase():
    frase = input("\n\n\tDigite uma frase\n\t==> ")
    letra = input ("\n\n\tAgore digite uma letra para contar\n\t==> ")
    count = 0
    
    while True:
        if frase == "":
            print("\n\n\tVocê precisa digitar uma frase!")
            sleep(2)
            system('cls')
            return phrase()
        else:
            for x in frase:
                if x == letra:
                    count = count + 1
            print (f"\n\n\tA letra {letra} apareceu {count} vezes, na frase:\n\n\t\"{frase}\"")
            break
phrase()