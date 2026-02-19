print("PROGRAMA PARA CALCULAR ÁREA DE UM CÍRCULO (EM CM^2)")

input("Está com dúvida na materia de matemática? ")
input("Bora então? ")

R=float(input("\nDigite o raio do seu círculo (em cm): "))
area=3.1415*R**2

while True:
    if area<0:
        print("\nAs medidas digitadas não dão uma área real!")
    else:
        print("\nA área do seu círculo é de: ", area,"cm^2")
        break
    
print("Obrigado por usar esse programa!")