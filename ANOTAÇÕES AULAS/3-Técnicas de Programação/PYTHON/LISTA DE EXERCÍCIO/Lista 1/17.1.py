print("PROGRAMA PARA CALCULAR PERÍMETROS DE UM POLÍGONO REGULAR (EM CM)")

input("Está com dúvida na materia de matemática? ")
input("Bora então? ")

QtdLad=float(input("\nDigite a quantidade de lados presentes no seu polígonos (em cm): "))
Med=float(input("Digite o valor de um de seus lados(em cm): "))
per=QtdLad*Med

while True:
    if per<0:
        print("\nAs medidas digitadas não dão um perímetro real!")
    else:
        print("\nO perímetro do seu polígono é de: ", per,"cm")
        break
    
print("Obrigado por usar esse programa!")