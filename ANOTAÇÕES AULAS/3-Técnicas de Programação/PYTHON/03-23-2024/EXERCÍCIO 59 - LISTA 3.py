print("EXERCÍCIO 59 - LISTA 3")

num=int(input("\nDigite um número natural: "))

i=0

while i<num:
    if i==0 or i==num-1:
        print("0"*num)
    else:
        print("0"+" "*(num-2)+"0")
    i+=1