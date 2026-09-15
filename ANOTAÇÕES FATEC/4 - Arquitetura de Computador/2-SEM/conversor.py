def decimal_para_binario(numero):
    return bin(numero)[2:]

def decimal_para_hexadecimal(numero):
    return hex(numero)[2:].upper()

def binario_para_decimal(numero):
    return int(numero, 2)

def hexadecimal_para_decimal(numero):
    return int(numero, 16)

def menu():
    while True:
        print("\n=== Conversor de Sistemas Numéricos ===")
        print("1. Decimal -> Binário")
        print("2. Decimal -> Hexadecimal")
        print("3. Binário -> Decimal")
        print("4. Hexadecimal -> Decimal")
        print("5. Sair")

        opcao = input("Escolha uma opção: ")

        try:
            if opcao == "1":
                num = int(input("Digite um número decimal: "))
                print("Binário:", decimal_para_binario(num))

            elif opcao == "2":
                num = int(input("Digite um número decimal: "))
                print("Hexadecimal:", decimal_para_hexadecimal(num))

            elif opcao == "3":
                num = input("Digite um número binário: ")
                print("Decimal:", binario_para_decimal(num))

            elif opcao == "4":
                num = input("Digite um número hexadecimal: ")
                print("Decimal:", hexadecimal_para_decimal(num))

            elif opcao == "5":
                print("Encerrando o programa...")
                break

            else:
                print("Opção inválida!")

        except ValueError:
            print("Valor inválido! Verifique a entrada.")

menu()