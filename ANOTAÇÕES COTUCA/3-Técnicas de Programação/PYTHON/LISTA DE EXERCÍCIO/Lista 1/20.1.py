print("PROGRAMA PARA CALCULAR ÁREA DE QUADRADO (EM CM^2)")

input("Está com dúvida na materia de matemática? ")
input("Bora então? ")

A=float(input("\nDigite a medida de qualquer lado do quadrado (em cm): "))
area=A**2

while True:
    if area<0:
        print("\nAs medidas digitadas não dão uma área real!")
    else:
        print("\nA área do seu quadrado é de: ", area,"cm^2")
        break
    
print("Obrigado por usar esse programa!")