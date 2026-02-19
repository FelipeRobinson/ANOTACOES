print("PROGRAMA PARA POPULAR UMA LISTA DE NÚMEROS\n")
while True:
    while True: # repete até o usuário informar uma quantidade válida
        try:
            quantidade=int(input("Quantos elementos deseja incluir na lista? "))
            if quantidade<0:
                print("Quantidades devem ser números naturais; tente novamente!")
            else:
                break # foi informada uma quantidade válida e o while para
        except ValueError:
            print("Quantidades devem ser números naturais; tente novamente!")
    
    lista=[]
    atual=1
    while atual<=quantidade:
        while True: # repete até o usuário informar um número para incluir na lista
            try:
                numero=float(input("Digite um número para incluir na lista? "))
                break # foi informado um número e o while para
            except ValueError:
                print("Foi pedido um número; tente novamente!")
                
        lista.append(numero)
        atual+=1 # atual=atual+1
    
    print("A lista gerada ficou assim:",lista)
    
    while True:
        quest = input("Deseja criar outra lista?[S,N] ")
        if quest.lower() == "s":
            break

        while True:
            media=[]
            n=1
            quest = input("Deseja calcular a média?[S,N] ")
            if quest.lower() == "n":
                break
            elif quest.lower() == "s":
                media=sum(lista)/len(lista)
                print("A média dos números da lista= ", media)
                break

        while True:
            


print("\nOBRIGADO POR USAR ESTE PROGRAMA!")