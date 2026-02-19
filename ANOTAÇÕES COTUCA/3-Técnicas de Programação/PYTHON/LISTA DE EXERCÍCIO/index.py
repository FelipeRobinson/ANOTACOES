print("PROGRAMAPARA ESCREVER POR EXTENSO VALORES MONETÁRIOS ENTRE -9,99 E 0,00\n")

texto=input("Digite o valor desejado: ")

try:
    valor=float(texto)
    if (valor<0):
        negativo=True
        valor=-valor
        texto=texto[1:]
    else:
        negativo=False

    pedaco=texto.split(".")

    if len(pedaco)==1:
            pedaco.append("00")
    if pedaco[0]=="":
            pedaco[0]="0"
    if len(pedaco[1]==-1):
        pedaco[1]=pedaco[1]-"0"

    if len(pedaco[0])!=1 or len(pedaco[1])!=2:
         print("Valor monetário com excesso de dígitos!")
    elif negativo and valor==-0:
        print("Menos zero reais é um valor absurdo!")
    elif negativo:
        print("menos ",end="")
    
        if (pedaco[0]=="1"):
            print("um real")
        elif (pedaco[0]=="2"):
            print("dois, reais")
except ValueError:
    print("Valores monetários devem ser numéricos!")



# append = adicionar
# len = descobre a quantidade de pedaços