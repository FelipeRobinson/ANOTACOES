print("PROGRAMA PARA CALCULAR PERÍMETROS DE UM QUADRADO/LOSANGO (EM CM)")

input("Está com dúvida na materia de matemática? ")
input("Bora então? ")

L1=float(input("\nDigite o valor do lado do seu quadrado (em cm): "))
per=L1*4

while True:
    if per<=0:
        print("\nAs medidas digitadas não dão um perímetro real!")
    else:
        print("\nO perímetro do seu quadrado/losango é de: ", per,"cm")
        break
    
print("Obrigado por usar esse programa!")