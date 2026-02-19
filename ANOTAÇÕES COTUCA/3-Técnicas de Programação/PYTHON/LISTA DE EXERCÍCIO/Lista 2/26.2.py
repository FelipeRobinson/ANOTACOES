print("PROGRAMA PARA CALCULAR O ÍNDCE DE MASSA CORPORAL (BMI)")

input("Está preocupado com seu índice de massa corporal? ")
input("Dseja saber seu índice de massa corporal? ")
input("Bora lá? ")

P=float(input("\nQual é seu peso (em Kilos)? "))
A=float(input("Qual a sua altura (em Metros)? "))
BMI=P/(A**2)

while True:
    if BMI<0:
        print("Os valores digitados te dão um índice de massa corporal deshumano")
    else:
        print("O seu índice de massa corporal é", BMI)
        break

print("\nObrigado por usar o programa!")