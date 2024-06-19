'''
O print é um código que serve para mostrar algo para o usuário
'''
def qualquercoisa():
    print("+--------------------------------+")
    print("|        To learn Python         |")
    print("|           by UDEMY             |")
    print("|            FELIPE              |")
    print("|          15/06/2024            |")
    print("+--------------------------------+")


'''
O input, é um código para pedir alguma informação, sendo ela algo escrito, 
ou algo numerico, porém quando númerico, deve ser acompanhado de um float 
(para números quebrados), ou int (para números inteiros).
'''
def outracoisa():
    numero = int(input("Quantos anos você tem?(NUM): "))
    
    if numero >= 18:
        print("Parabéns, agora você pode ser preso...")
    else:
        print("Vishhh. Melhor ter cuidado com seu responsável...")


outracoisa()