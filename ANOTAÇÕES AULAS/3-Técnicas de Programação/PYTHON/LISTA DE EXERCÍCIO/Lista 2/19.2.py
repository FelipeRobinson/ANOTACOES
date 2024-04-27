print("PROGRAMA PARA CALCULAR ÁREA DE UM TRIÂNGULO (EM CM)")

input("Está com dúvida na materia de matemática? ")
input("Bora então? ")

A=float(input("\nDigite a altura do seu triângulo (em cm): "))
B=float(input("Digite a medida da base do seu triângulo (em cm): "))
area=(A*B)/2

while True:
    if area<0:
        print("\nAs medidas digitadas não dão uma área real!")
    else:
        print("\nA área do seu triângulo é de: ", area,"cm")
        break
    
print("Obrigado por usar esse programa!")