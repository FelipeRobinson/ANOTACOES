print("PROGRAMA PARA CALCULAR ÁREA DE LOSANGO/PARALELOGRAMO (EM CM^2)")

input("Está com dúvida na materia de matemática? ")
input("Bora então? ")

d=float(input("\nDigite a medida da diagonal menor (em cm): "))
D=float(input("\nDigite a medida do diagonal maior (em cm): "))
area=(d*D)/2

while True:
    if area<0:
        print("\nAs medidas digitadas não dão uma área real!")
    else:
        print("\nA área do seu losango/paralelogramo é de: ", area,"cm^2")
        break
    
print("Obrigado por usar esse programa!")