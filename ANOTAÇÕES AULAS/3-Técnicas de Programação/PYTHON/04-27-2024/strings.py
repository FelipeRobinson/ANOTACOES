txt="CTC"
txt="Colégio Técnico de Campinas"
lst=txt.split()
print(lst)
txt="Colégio, Técnico,,de , campinas"
lst=txt.split(",")
print(id(txt))
txt=txt.replace(","," ")
print(txt)
print(id(txt))

# id serve para printar um endereço onde uma variável está guardada na memória

lst=list(txt)
novo="".join(lst)
print(novo)

novo2="|".join(lst)
print(novo2)

novo[0]='A'

tup=([1,2,3],[4,5],[6,7])
'adicionando numeros a tup' 
tup[0]=[8,9]
'ele não deixa, pois a TUP é inalterável'