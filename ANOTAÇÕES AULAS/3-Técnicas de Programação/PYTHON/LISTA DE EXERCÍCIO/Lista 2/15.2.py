print("PROGRAMA PARA CALCULAR PERÍMETROS DE UM RETÂNGULO/PARALELOGRAMO (EM CM)")

input("Está com dúvida na materia de matemática? ")
input("Bora então? ")

L1=float(input("\nDigite o valor do seu lado maior (em cm): "))
L2=float(input("Digite o valor do seu lado menor z(em cm): "))
per=L1*2+L2*2

while True:
    if per<0:
        
        print("\nAs medidas digitadas não dão um perímetro real!")
    else:
        print("\nO perímetro do seu retângulo/paralelogramo é de: ", per,"cm")
        break
    
print("Obrigado por usar esse programa!")