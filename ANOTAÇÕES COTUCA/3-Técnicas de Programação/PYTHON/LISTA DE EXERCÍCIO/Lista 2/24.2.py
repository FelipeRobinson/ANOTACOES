print("PROGRAMA PARA CALCULAR ÁREA DE UM QUADRADO (EM CM^2)")

input("Está com dúvida na materia de matemática? ")
input("Bora então? ")

Q=float(input("\nDigite a quantidade de lados do seu quadrado (em cm): "))
B=float(input("\nDigite a medida do base do seu quadrado (em cm): "))
A=float(input("\nDigite a medida da reta imaginária que une o centro ao meio da base do seu quadrado (em cm): "))
area=(Q*B*A)/2

while True:
    if area<0:
        print("\nAs medidas digitadas não dão uma área real!")
    else:
        print("\nA área do seu quadrado é de: ", area,"cm^2")
        break
    
print("Obrigado por usar esse programa!")