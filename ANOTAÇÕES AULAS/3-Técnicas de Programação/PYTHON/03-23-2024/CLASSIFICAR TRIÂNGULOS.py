print("PROGRAMA PARA CLASSIFICAR TRIÂNGULOS COM BASE NOS ÂNGULOS")

while True:
    while True:
        while True:
            try:
                ang1=float(input("Digite a medida em graus do 1º ângulo: "))
                if ang1<=0 or ang1>=180:
                    print("Ângulos de triângulos devem ser maiores do que 0 graus e menores que 180")
                    print("Tente novamente")
                else:
                    break
            except ValueError:
                print("Ângulos devem ser numéricos")
                print("Tente novamente")

        while True:
            try:
                ang2=float(input("Digite a medida em graus do 2º ângulo: "))
                if ang2<=0 or ang1>=180:
                    print("Ângulos de triângulos devem ser maiores do que 0 graus e menores que 180")
                    print("Tente novamente")
                else:
                    break
            except ValueError:
                print("Ângulos devem ser numéricos")
                print("Tente novamente")

        while True:
            try:
                ang3=float(input("Digite a medida em graus do 3º ângulo: "))
                if ang3<=0 or ang3>=180:
                    print("Ângulos de triângulos devem ser maiores do que 0 graus e menores que 180")
                    print("Tente novamente")
                else:
                    break
            except ValueError:
                print("Ângulos devem ser numéricos")
                print("Tente novamente")

        if ang1+ang2+ang3==180:
            print("Com esses ângulos, não é possível classificar um triângulo")
            print("Tente novamente")
        else:
            break

    if ang1<90 and ang2<90 and ang3<90:
        print("Trata-se de um triângulo acutângulo")
    elif ang1==90 or ang2==90 or ang3==90:
        print("Trata-se de um triângulo retângulo")
    else:
        print("Trata-se de um triângulo obtusângulo")

    while True:
        resposta=input("Deseja classificar novos triângulos (S/N)? ")
        if resposta not in ["s", "S", "n","N"]:
            print("A resposta deve ser S ou N\nTente novamente!")
        else:
            break
    if resposta in ["n","N"]:
        break

print("\nOBRIGADO POR USAR ESSE PROGRAMA!")