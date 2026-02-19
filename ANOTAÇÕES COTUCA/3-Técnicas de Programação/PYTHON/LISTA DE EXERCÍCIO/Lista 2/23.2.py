print("PROGRAMA PARA CALCULAR ÁREA DE TRAPÉZIO (EM CM^2)")

input("Está com dúvida na materia de matemática? ")
input("Bora então? ")

b=float(input("\nDigite a medida da base menor do seu trapézio (em cm): "))
B=float(input("\nDigite a medida do base maior do seu trapézio (em cm): "))
A=float(input("\nDigite a medida da altura do seu trapézio (em cm): "))
area=((b+B)*A)/2

while True:
    if area<0:
        print("\nAs medidas digitadas não dão uma área real!")
    else:
        print("\nA área do seu retângulo é de: ", area,"cm^2")
        break
    
print("Obrigado por usar esse programa!")