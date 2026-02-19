print("Calculadora para Seu Triângulo\n")

input("Tudo bem? ")
input("Vamos calcular o perímetro do seu triângulo? ")
print("Lembrando que você só pode colocar números inteiros e em centímetros\n")

# a tag "int", transforma o texto em número
# a tag "float", vai permitir que o usuario possa colocar um número com virgula


primeiro=int(input("Digite o primeiro valor: "))
segundo=int(input("Digite outro valor: "))
terceiro=int(input("Digite o ultimu valor: "))
print("")

resultado=primeiro+segundo+terceiro

print("O perímetro do seu triângulo é", resultado)