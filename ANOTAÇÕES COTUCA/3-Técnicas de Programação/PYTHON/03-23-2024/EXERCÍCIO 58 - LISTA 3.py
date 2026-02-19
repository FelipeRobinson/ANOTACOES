print("PROGRAMA PARA DESENHAR RETÂNGULOS")

try:
    qtdLins=qtdCols=int(input("Deseja um quadrado de quantas linhas? "))
    if (qtdLins<=1):
        print("A quantidade de linhas deve ser um interio acima de 1")
    else:
        lin=1
        while lin<=qtdLins:
            col=1
            while col<=qtdCols:
                print("o", end="")
                col=col+1
            print()
            lin=lin+1 # lin+=1 

except ValueError:
    print("A quantidade de linhas deve ser um inteiro acima de 1!")

print("\nOBRIGADO POR USAR ESSE PROGRAMA!")