print("PROGRAMA PARA CALCULAR PERÍMETROS DE UM TRAPÉZIO (EM CM)")

input("Está com dúvida na materia de matemática? ")
input("Bora então? ")

m=float(input("\nDigite o valor do seu menor lado (em cm): "))
M=float(input("Digite o valor do seu maior lado (em cm): "))
O=float(input("Digite o valor do seu outro lado (em cm): "))
per=m+M+O*2

while True:
    if per<0:
        print("\nAs medidas digitadas não dão um perímetro real!")
    else:
        print("\nO perímetro do seu trapézio é de: ", per,"cm")
        break
    
print("Obrigado por usar esse programa!")