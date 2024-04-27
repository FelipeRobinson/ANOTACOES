n = int (input ("\n\n\n\tDigite sua idade:\t"))

if n < 5:
    print ("\n\n\tAbaixo de 5 anos: Sem classificação")
    print (f"\tSua idade: {n} anos\n\n\n")
    
elif 5 <= n <= 7:
    print ("\n\n\tDe 5 a 7 anos: Classificação de 'Infantil A'")
    print (f"\tSua idade: {n} anos\n\n\n")

elif 8 <= n <= 10:
    print ("\n\n\tDe 8 a 10 anos: Classificação de 'Infantil B'")
    print (f"\tSua idade: {n} anos\n\n\n")

elif 11 <= n <= 13:
    print ("\n\n\tDe 11 a 13 anos: Classificação de 'Infanto-Juvenil'")
    print (f"\tSua idade: {n} anos\n\n\n")

elif 14 <= n <= 16:
    print ("\n\n\tDe 14 a 16 anos: classificação de 'Juvenil'")
    print (f"\tSua idade: {n} anos\n\n\n")

elif 17 <= n <= 20:
    print ("\n\n\tDe 17 a 20 anos: Classificação de 'Júnior'")
    print (f"\tSua idade: {n} anos\n\n\n")
    
else:
    print ("\n\n\tAcima de 20 anos: Classificação de 'Adulto'")
    print (f"\tSua idade: {n} anos\n\n\n")