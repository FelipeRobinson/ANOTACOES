print("PROGRAMA PARA CALCULAR O PERÍMETRO DE TRIÂNGULOS\n")

# a tag "try" funciona para encontrar um erro em uma perguntra e não dar sequência na atividade
formulouTriangulo=False
while not formulouTriangulo:
    digitouDireito=False
    while not digitouDireito:
        try:    
            lado1=float(input("Digite a medida em cm do 1º lado: "))
            if lado1<=0:
                print("Medidas devem ser positivas; Tente novamente!")
            else:
                digitouDireito=True
        except ValueError:
            print("Medidas devem ser numéricas (Lembre-se de usar o ponto decimal, em vez de vírgular); tente novamente!")

    digitouDireito=False
    while not digitouDireito:
        try:    
            lado2=float(input("Digite a medida em cm do 2º lado: "))
            if lado1<=0:
                print("Medidas devem ser positivas; Tente novamente!")
            else:
                digitouDireito=True
        except ValueError:
            print("Medidas devem ser numéricas (Lembre-se de usar o ponto decimal, em vez de vírgular); tente novamente!")

    digitouDireito=False
    while not digitouDireito:
        try:    
            lado3=float(input("Digite a medida em cm do 3º lado: "))
            if lado1<=0:
                print("Medidas devem ser positivas; Tente novamente!")
            else:
                digitouDireito=True
        except ValueError:
            print("Medidas devem ser numéricas (Lembre-se de usar o ponto decimal, em vez de vírgular); tente novamente!")

    if lado1>lado2>lado3 or lado2>=lado1+lado3 or lado3>=lado1+lado2:
        print("Com essas medidas não se forma um triângulo; tente novamente!")
    else:
        formulouTriangulo=True

perimetro=lado1+lado2+lado3
print("O perímetro desejado vale", perimetro)

respondeuDireito=False
while not respondeuDireito

print("\nOBRIGADO POR USAR ESSE PROGRAMA!")