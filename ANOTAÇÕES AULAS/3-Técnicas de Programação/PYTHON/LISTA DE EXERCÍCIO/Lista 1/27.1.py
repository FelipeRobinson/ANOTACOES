print("PROGRAMA PARA CALCULAR UMA EQUÇÃO DE PRIMEIRO GRAU\n")

A=float(input("Qual o valor do seu coeficiente A? "))
B=float(input("Qual o valor do seu coeficiente B? "))
X=-B/A

while True:
    if X>0:
        print("Seu valor não bate")
    else:
        print("O valor do seu x é",X)
        break
    
print("Obrigado por usar o programa!")