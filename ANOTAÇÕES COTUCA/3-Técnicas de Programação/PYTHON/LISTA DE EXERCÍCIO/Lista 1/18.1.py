print("PROGRAMA PARA CALCULAR PERÍMETROS DE UM CÍRCULO (EM CM)")

input("Está com dúvida na materia de matemática? ")
input("Bora então? ")

R=float(input("\nDigite o valor do raio do seu círculo (em cm): "))
per=2*3.1415*R

while True:
    if per<0:
        print("\nAs medidas digitadas não dão um perímetro real!")
    else:
        print("\nO perímetro do seu  é de: ", per,"cm")
        break
    
print("Obrigado por usar esse programa!")