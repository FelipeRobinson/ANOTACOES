print("PROGRAMA PARA CALCULAR PERÍMETROS DE TRIÂNGULOS\n")

denovo=True
while denovo:
    formouTriangulo=False
    while not formouTriangulo:
        digitouDireito=False
        while not digitouDireito:
            try:
                lado1=float(input("Digite a medida em cm do 1º lado: "))
                if lado1<=0:
                    print("Medidas devem ser positivas; tente novamente!")
                else:
                    digitouDireito=True
            except ValueError:
                print("Medidas devem ser numéricas (lembre-se de usar ponto decimal em vez de virgula); tente novamente!")
        
        digitouDireito=False
        while not digitouDireito:
            try:
                lado2=float(input("Digite a medida em cm do 2º lado: "))
                if lado2<=0:
                    print("Medidas devem ser positivas; tente novamente!")
                else:
                    digitouDireito=True
            except ValueError:
                print("Medidas devem ser numéricas (lembre-se de usar ponto decimal em vez de virgula); tente novamente!")
        
        digitouDireito=False
        while not digitouDireito:
            try:
                lado3=float(input("Digite a medida em cm do 3º lado: "))
                if lado3<=0:
                    print("Medidas devem ser positivas; tente novamente!")
                else:
                    digitouDireito=True
            except ValueError:
                print("Medidas devem ser numéricas (lembre-se de usar ponto decimal em vez de virgula); tente novamente!")

        if lado1>=lado2+lado3 or lado2>=lado1+lado3 or lado3>=lado1+lado2:
            print("Com essas medidas não se forma um triângulo; tente novamente!")
        else:
            formouTriangulo=True
            perimetro=lado1+lado2+lado3
            print("O perímetro desejado vale",perimetro)

    repeat=input("Deseja calcular outro triangulo? ")
    if repeat.lower()=="não" or repeat.lower()=="nao":
        denovo=False
        print("Obrigado por usar o programa...")
    else:
        print("Bora lá então")