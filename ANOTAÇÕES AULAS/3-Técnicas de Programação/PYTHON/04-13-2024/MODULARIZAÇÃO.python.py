def obtencaoDeUmNumeroNatural (pergunta,limite_inferior):
# definindo o modulo (limite_inferior)
    while True:
        try:
            numero=int(input(pergunta))
       	    if (numero<limite_inferior):
                print("Deve-se digitar um número acida de",limite_inferior,"para cima!")
            else:
    	        break
    	except ValueError:
        		print("Deve-se digitar um número de",limite_inferior"para cima!")
        		
    return numero
    # nem todo modulo manda um valor de retorno, apenas cumpre uma missão
    
def mostra (caractere,qtsVezes,ehParaPularDeLinha=True):
    mostrado=0
    while mostrado<qtdVezes:
        print(caractere,end="")
        mostrado=+1
    
    if ehParaPularDeLinha: 
        print()
        
mostra("A",16,False)
mostra("o",15,True)
    
def desenhaQuadradVazado (qLin,qCol):
    mostra("O",qCol)
    
    lin=2
    while lin<qLins-1
        mostra("O",1,False)
        mostra(" ",qCol-2,False)
        mostra("O",1)
        lin+=1
        
    mostra("O",qCol)

print("PROGRAMA PARA DESENHAR QUADRADOS VAZADOS\n")
# chama o modulo
qtdLins=qtdCols=obtencaoDeUmNumeroNatural("Deseja um quadrado de quantas linhas? ",2)
# essa linha é definida como vai funcionar o def obtencaoDeUmNumeroNatural
# o modulo foi chamado de dois pq não faz sentido ter um quadrado com 0 ou 1 linha...
desenhaQuadradVazado(qtdLins,qtdCols)
    
print("\nObrigado por usar este programa!")