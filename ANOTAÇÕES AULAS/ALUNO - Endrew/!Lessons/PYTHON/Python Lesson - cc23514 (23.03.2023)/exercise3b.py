from os import system
from time import sleep

system('cls')

def digits(algo):
    for caractere in algo:
        if not caractere.isdigit():
            return False
    return True

algo = input("\n\n\tDigite algo\n\t==> ")
if digits(algo):
    print("\n\tContém apenas dígitos!")
else:
    print("\n\tNão contém apenas dígitos!")

sleep(3)
system ('cls')