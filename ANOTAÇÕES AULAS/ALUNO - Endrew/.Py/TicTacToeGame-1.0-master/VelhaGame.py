import subprocess
import sys
from os import system

try:
    from time import sleep
    import art
    import msvcrt
    import random
    
except ImportError:
    system('')

    g = "\033[92m"
    r = "\033[91m"
    end = "\033[0m"

    def install(packages):
        for package in packages:
            try:
                subprocess.check_call([sys.executable, "-m", "pip", "install", package])
                print(f"{g}{package} foi instalado com sucesso!{end}")
            except subprocess.CalledProcessError as err:
                print(f"{r}Erro ao instalar {package}.{end}")
                print(f"Erro: {err}")

    install(['msvcrt', 'time',  'art', 'random'])
    
cmd = 'mode 90, 30'
system(cmd)
system('cls')

gaming = art.text2art(("Jogo  da  Velha").center(38), font="small")
bye = art.text2art(("\n"*11) + ("Tchau :)".center(53)), font="medium")

def welcome():
    print(("\n"*3).center(20) + "*"*70)
    print(gaming)
    print(("*"*70).center(87))
    print(("\n"*5).center(52) + "Seja bem-vindo(a) ao jogo da velha 1.0")
    print(("\n").center(66) + "DSNOT - Cotuca(Unicamp)")
    print(("\n").center(62) + "Criado por Endrew Oliveira")
    print(("\n"*6).center(61) + "Pressione ENTER para continuar...")
    while True:
        if msvcrt.kbhit() and msvcrt.getch() == b'\r':
            break
welcome()
    
def menu():

    options = ["Jogar contra computador", "Jogar contra player", "Ver as instruções", "Sair"]
    selected = 0
    
    cmd = 'mode 39, 30'
    system(cmd)
       
    while True:
        
        system('cls')
        
        for i, option in enumerate(options):
            if i == selected:
                print("\n"*5 + f"\t> {option} <")
            else:
                print("\n"*5 + f"\t{option}")
        
        key = msvcrt.getch()
        
        if key == b"\xe0":
            key = msvcrt.getch()
            if key == b"H":
                selected = max(selected - 1, 0)
            elif key == b"P":
                selected = min(selected + 1, len(options) - 1)
        
        elif key == b"\r":
            break
                
    if options[selected] == options[0]:
        def pvc():
            system('cls')
            tab = [' ']*9

            def mostra():
                print("\n"*6)
                print(f" {tab[0]} | {tab[1]} | {tab[2]}".center(43))
                print(("---+---+---").center(45))
                print(f" {tab[3]} | {tab[4]} | {tab[5]}".center(43))
                print(("---+---+---").center(45))
                print(f" {tab[6]} | {tab[7]} | {tab[8]}".center(43))
                print("\n"*4)

            def win():
                if tab[0] != ' ' and tab[0] == tab[1] and tab[1] == tab[2] or \
                tab[3] != ' ' and tab[3] == tab[4] and tab[4] == tab[5] or \
                tab[6] != ' ' and tab[6] == tab[7] and tab[7] == tab[8] or \
                tab[0] != ' ' and tab[0] == tab[3] and tab[3] == tab[6] or \
                tab[1] != ' ' and tab[1] == tab[4] and tab[4] == tab[7] or \
                tab[2] != ' ' and tab[2] == tab[5] and tab[5] == tab[8] or \
                tab[0] != ' ' and tab[0] == tab[4] and tab[4] == tab[8] or \
                tab[2] != ' ' and tab[2] == tab[4] and tab[4] == tab[6]:
                    return True
                else:
                    return False
                
            while True:
                cmd = 'mode 47,30'
                system(cmd)
                system('cls')
                player = input("\n"*12 + "\tEscolha seu símbolo, \"X\" ou \"O\"\n\t--> ")
                player = player.upper()
                
                sleep(0.5)
                system('cls')

                if player == 'X':
                    player_pc = 'O'
                    break
                elif player == 'O':
                    player_pc = 'X'
                    break
                else:
                    print("\n"*12 + "\tDigíte \"X\" ou \"O\"")
                    sleep(1.5)
                    continue
                
            print("\n"*11 + "\tSorteando quem começa...")
            sleep(2)
            start = random.randint(0, 1)

            if start == 0:
                vez = "player"
                print("\n"*2 + "\tVocê começa!")
                sleep(1.5)
                system('cls')
            else:
                vez = "pc"
                print("\n"*2 + "\tO computador começa!")
                sleep(1.5)
                system('cls')

            def jogada(lugar):
                if tab[lugar] == ' ':
                    return True
                else:
                    return False

            while True:
                system('cls')
                if vez == 'player':
                    mostra()
                    print("\tPlayer, escolha sua jogada")
                    n = (input("\t--> "))
                    try:
                        n  = int(n)
                        if n in range(1, 10):
                            if jogada(n - 1):
                                tab[n - 1] = player
                                vez = 'pc' 
                        else:
                            print("\n"*2 + "\tEsse número não está no jogo...")
                            print("\tEscolha um número de 1 a 9")
                            sleep(2)
                            system('cls')
                            continue
                    except ValueError:
                        print("\n"*2 + "\tEscolha um número de 1 a 9...")
                        sleep(2)
                        system('cls')
                        continue
                        
                elif vez == 'pc':
                    while True:
                        jogada_pc = random.randint(0, 8)
                        if jogada(jogada_pc):
                            tab[jogada_pc] = player_pc
                            break
                    vez = 'player'
                    
                if win():
                    system('cls')
                    mostra()
                    if vez == 'pc':
                        print(("\n"*2).center(26) + "Parabéns, você venceu!")
                        print(("\n"*6).center(19) + "Pressione ESC para voltar ao menu...")
                        while True:
                            if msvcrt.kbhit():
                                    if ord(msvcrt.getch()) == 27:
                                        break
                        break
                    else:
                        print(("\n"*2).center(28) + "O computador venceu!")
                        print(("\n"*6).center(19) + "Pressione ESC para voltar ao menu...")
                        while True:
                            if msvcrt.kbhit():
                                    if ord(msvcrt.getch()) == 27:
                                        break
                        
                    break
                
                elif " " not in tab:
                    mostra()
                    print(("\n"*2).center(40) + "Empate!")
                    print(("\n"*6).center(19) + "Pressione ESC para voltar ao menu...")
                    while True:
                        if msvcrt.kbhit():
                                if ord(msvcrt.getch()) == 27:
                                    break
                    break
            return menu()                
        pvc()

    if options[selected] == options[1]:
        system('cls')
        def pvp():
            system('cls')
            tab = [' ']*9

            def mostra():
                print("\n"*6)
                print(f" {tab[0]} | {tab[1]} | {tab[2]}".center(43))
                print(("---+---+---").center(45))
                print(f" {tab[3]} | {tab[4]} | {tab[5]}".center(43))
                print(("---+---+---").center(45))
                print(f" {tab[6]} | {tab[7]} | {tab[8]}".center(43))
                print("\n"*4)
                
            def win():
                if tab[0] != ' ' and tab[0] == tab[1] and tab[1] == tab[2] or \
                tab[3] != ' ' and tab[3] == tab[4] and tab[4] == tab[5] or \
                tab[6] != ' ' and tab[6] == tab[7] and tab[7] == tab[8] or \
                tab[0] != ' ' and tab[0] == tab[3] and tab[3] == tab[6] or \
                tab[1] != ' ' and tab[1] == tab[4] and tab[4] == tab[7] or \
                tab[2] != ' ' and tab[2] == tab[5] and tab[5] == tab[8] or \
                tab[0] != ' ' and tab[0] == tab[4] and tab[4] == tab[8] or \
                tab[2] != ' ' and tab[2] == tab[4] and tab[4] == tab[6]:
                    return True
                else:
                    return False

            def jogada():
                while True:
                    mostra()
                    print(f"\tJogador {player}, escolha sua jogada")
                    position = input("\t--> ")
                    try:
                        position  = int(position)
                        if position in range(1, 10):
                            return position
                        else:
                            print("\n"*2 + "\tEsse número não está no jogo...")
                            print("\tEscolha um número de 1 a 9")
                            sleep(2)
                            system('cls')
                            continue
                    except ValueError:
                        print("\n"*2 + "\tEscolha um número de 1 a 9...")
                        sleep(2)
                        system('cls')
                        continue

            while True:
                cmd = 'mode 47,30'
                system(cmd)
                system('cls')
                player =  input ("\n"*12 + "\tJogador 1, quer ser \"X\" ou \"O\" ?\n\t--> ")
                player = player.upper()
                
                sleep(0.5)
                system('cls')
                
                if player == "X":
                    print("\n"*12 + "\tEntão o jogador 2 fica com \"O\"")
                    sleep(1.5)
                    break
                elif player == "O":
                    print("\n"*12 + "\tEntão o jogador 2 fica com \"X\"")
                    sleep(1.5)
                    break
                else:
                    print("\n"*12 + "\tDigíte \"X\" ou \"O\"")
                    sleep(1.5)
                    continue
            
            j = 0
            while True:
                system('cls')
                n = jogada()
                if tab[n - 1] == 0:
                    if(j%2+1)==1:
                        tab[n - 1]=1
                    else:
                        tab[n - 1]=-1
                if tab[n - 1] == " ":
                    tab[n - 1] = player
                    
                    if win():
                        system('cls')
                        mostra()
                        print(("\n"*2).center(28) + f"O jogador {player} venceu!")
                        print(("\n"*6).center(19) + "Pressione ESC para voltar ao menu...")
                        while True:
                            if msvcrt.kbhit():
                                    if ord(msvcrt.getch()) == 27:
                                        break
                        break
                    elif " " not in tab:
                        system('cls')
                        mostra()
                        print(("\n"*2).center(40) + "Empate!")
                        print(("\n"*6).center(19) + "Pressione ESC para voltar ao menu...")
                        while True:
                            if msvcrt.kbhit():
                                    if ord(msvcrt.getch()) == 27:
                                        break
                        break
                    else:
                        player = "O" if player == "X" else "X"
                else:
                    print("\nEssa posição já está ocupada...")
                    print("Escolha uma posição vazia!")
                    sleep(2)
                    continue
            
            return menu()
            
        pvp()
        
    elif options[selected] == options[2]:
        def instructions():
            cmd = 'mode 120, 30'
            system(cmd)
            print(("\n"*7).center(55) + "Os jogadores jogam alternadamente, um de cada vez em uma posição vazia")
            print(("\n"*2).center(78) + "Ganha aquele que completar uma linha inteira")
            print(("\n"*2).center(36) + "O objetivo é conseguir uma linha com três \"O\" ou \"X\" na horizontal, vertical ou diagonal")
            print(("\n"*2).center(55) + "Pode dar empate se nenhum dos jogares conseguir completar uma linha")
            print(("\n"*9).center(90) + "Pressione ENTER para voltar ao menu...")
            while True:
                if msvcrt.kbhit() and msvcrt.getch() == b'\r':
                    return menu()
        instructions()
        
    elif options[selected] == options[3]:
        cmd = 'mode 90, 30'
        system(cmd)
        print(bye)
        sleep(1.5)
        system('cls')
        exit()
menu()
