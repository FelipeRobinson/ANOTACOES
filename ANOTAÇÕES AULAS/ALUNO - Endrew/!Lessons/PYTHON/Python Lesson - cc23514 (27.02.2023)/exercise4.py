n = int (input ("\n\n\n\tDigite um número para ver sua tabuada:\t"))

print (f"\n\n\n\tA tabuada do {n}")
print ("\t**************\n\n")

for x in range(11):
    print (f"\n\t{n} x {x} = {n*x}")