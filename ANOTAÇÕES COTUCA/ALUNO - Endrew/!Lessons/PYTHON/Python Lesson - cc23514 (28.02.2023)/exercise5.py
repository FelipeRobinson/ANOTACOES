n1 =  int (input ("\n\n\n\tDigite a sua nota de Matemática:\t\t"))
n2 = int (input ("\tDigite a sua nota de Português:\t\t\t"))
n3 = int (input ("\tDigite a sua nota de Geografia:\t\t\t"))
n4 = int (input ("\tDigite a sua nota da Lista de Exercícios:\t"))

media = float (((n1 + n2 * 2 + n3 * 3) + 4) / 7)

if media >= 9.0:
    print (f"\n\t{media:.2f} -> Conceito A = Você foi muito bem!\n\n\n")
    
elif 7.5 <= media < 9.0:
    print (f"\n\t{media:.2f} -> Conceito B = Você foi regular!n\n\n")
    
elif 6.0 <= media < 7.5:
    print (f"\n\t{media:.2f} -> Conceito C = Você está na média!\n\n\n")
    
else:
    print (f"\n\t{media:.2f} -> Conceito D = Você foi ruim!\n\n\n")