print("PROGRAMA PARA CALCULAR PERÍMETROS DE UM TRIÂNGULO (EM CM)")

input("Está com dúvida na materia de matemática? ")
input("Bora então? ")

A=float(input("Digite o valor do seu primeiro lado (em cm): "))
B=float(input("Digite o valor do seu segundo lado (em cm): "))
C=float(input("Digite o valor do seu terceiro lado (em cm): "))
per=A+B+C

while True:
    if per<0:
        print("As medidas digitadas não dão um perímetro real!")
    else:
        print("O perímetro do seu quadrado/losango é de: ", per,"cm")
        break
    
print("Obrigado por usar esse programa!")