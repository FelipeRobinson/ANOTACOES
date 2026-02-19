from os import system
from time import sleep

system('cls')

def substituir_letra():
    
    fraseOrigin = input("\n\n\n\tDigite uma frase\n\t==> ")
    
    while True:
        if fraseOrigin == "":
            print("\n\n\tVocê precisa digitar uma frase!")
            sleep(2)
            system('cls')
            return substituir_letra()
        
        else:
            antigaL = input("\n\n\tDigite uma letra que será substituída\n\t==> ")
            
            if antigaL == "":
                print("\n\n\tVocê precisa digitar uma letra que será substituída!")
                sleep(2)
                system('cls')
                return substituir_letra()
            else:
                novaL = input("\n\n\tDigite uma letra para substituir\n\t==> ")
                
                if novaL == "":
                    print("\n\n\tVocê precisa digitar uma letra que será substituída!")
                    sleep(2)
                    system('cls')
                    return substituir_letra()
                else:
                    fraseNova = ""
                    for letra in fraseOrigin:
                        if letra == antigaL:
                            fraseNova += novaL
                        else:
                            fraseNova += letra
                            
                    print(f"\n\n\tA frase fica assim\n\t\"{fraseNova}\"")
                    sleep(4)
                    system('cls')
                    return fraseNova
   

substituir_letra()