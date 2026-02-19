print("PROGRAMA PARA CALCULAR ÁREA DE RETÂNGULO (EM CM^2)")

input("Está com dúvida na materia de matemática? ")
input("Bora então? ")

m=float(input("\nDigite a medida do lado menor do seu retângulo (em cm): "))
M=float(input("\nDigite a medida do lado maior do seu retângulo (em cm): "))
area=M*m

while True:
    if area<0:
        print("\nAs medidas digitadas não dão uma área real!")
    else:
        print("\nA área do seu retângulo é de: ", area,"cm^2")
        break
    
print("Obrigado por usar esse programa!")