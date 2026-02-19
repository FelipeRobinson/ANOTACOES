Codigo do DIA:

lista1=[]
lista1.append(2)
lista1.append(3)
lista1.append(5)
lista1.append(6)
lista1.append(7)
lista1.append(8)
lista1.append(10)

# print(lista1)

lista2=[2,3,5,6,7]
lista3=lista2
lista3.append(11)

# print(lista3)

lista4=lista2.copy()
lista2.append(17)

# print(lista4)
# print(lista2)
# print(lista2[-4])
# ele vai printar apenas o elemento na posição []

# lista2.insert(4,9)
# print(lista2)

lista2[4]=99
# print(lista2)
# adicionou o 99 na posição [4]

lista2.remove(99)
#print(lista2)

del lista2[4]
print(lista2)
