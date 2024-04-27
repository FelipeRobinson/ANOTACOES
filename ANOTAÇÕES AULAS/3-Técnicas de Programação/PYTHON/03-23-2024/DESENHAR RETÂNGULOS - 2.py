print("PROGRAMA PARA DESENHAR LINHAS")

qtd_caracteres=int(input("Digite uim número natural para a quantidade de linhas: "))

contador=0
linha="o"
while contador<qtd_caracteres:
    linhas=linha+"0"
    contador=contador+1

contador=0
while contador<qtd_caracteres:
    print(linha)
    contador=contador+1

print("Obrigado por usar o programa!")