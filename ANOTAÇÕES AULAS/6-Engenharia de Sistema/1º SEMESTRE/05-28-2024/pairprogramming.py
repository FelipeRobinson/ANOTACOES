def mostraJogo(jogadas):
    for lin in range(3):
        for col in range(3):
            if col == 2:
                print(f" {jogadas[lin][col]} ")
            else:
                print(f" {jogadas[lin][col]} ", end='|')
        if lin != 2:
            print("---+---+---")
    print()

def ganhou(jogadas):
    for lin in range(3):
        if jogadas[lin][0] == jogadas[lin][1] == jogadas[lin][2] and jogadas[lin][0] != ' ':
            return True
    for col in range(3):
        if jogadas[0][col] == jogadas[1][col] == jogadas[2][col] and jogadas[0][col] != ' ':
            return True
    if jogadas[0][0] == jogadas[1][1] == jogadas[2][2] and jogadas[0][0] != ' ':
        return True
    if jogadas[0][2] == jogadas[1][1] == jogadas[2][0] and jogadas[0][2] != ' ':
        return True
    return False

def deuVelha(jogadas):
    for lin in range(3):
        for col in range(3):
            if jogadas[lin][col] == ' ':
                return False
    return True

def trocaDeJogador(jog):
    return 'O' if jog == 'X' else 'X'

import os

print("\n**********  JOGO DA VELHA PAIR PROGRAMING  **********")
print("*************  POR FELIPE E THIAGO  *************\n")

jogadas = [[' ', ' ', ' '], [' ', ' ', ' '], [' ', ' ', ' ']]
vezDeQuem = 'X'
qtasJogadas = 9

while not ganhou(jogadas) and not deuVelha(jogadas) and qtasJogadas != 0:
    os.system('cls' if os.name == 'nt' else 'clear')
    mostraJogo(jogadas)
    
    while True:
        try:
            linha = int(input(f"Jogador {vezDeQuem}, deseja jogar em qual linha (0, 1, 2)? "))
            coluna = int(input(f"Jogador {vezDeQuem}, deseja jogar em qual coluna (0, 1, 2)? "))
            if linha in range(3) and coluna in range(3) and jogadas[linha][coluna] == ' ':
                jogadas[linha][coluna] = vezDeQuem
                break
            else:
                print("Posição inválida ou já ocupada. Tente novamente.")
        except ValueError:
            print("Entrada inválida. Por favor, insira números entre 0 e 2.")
    
    qtasJogadas -= 1
    vezDeQuem = trocaDeJogador(vezDeQuem)

os.system('cls' if os.name == 'nt' else 'clear')
mostraJogo(jogadas)

if ganhou(jogadas):
    print(f"Parabéns! O jogador {trocaDeJogador(vezDeQuem)} ganhou!")
else:
    print("Deu velha!")
