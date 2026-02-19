n1 =  float (input ("\n\n\n\tSeu peso em kg\n\tEx: 56 ===>\t"))
n2 = float (input ("\tSua altura em metros\n\tEx: 1.75 ===>\t"))

IMC = float (n1/(n2*n2))

if IMC <= 18.5:
    print ("\n\tAbaixo do peso normal")
    
elif 18.5 < IMC <= 25:
    print ("\n\tPeso Normal")
    
elif 25 < IMC <= 30:
    print ("\n\tAcima do peso normal")
    
else:
    print ("\n\tObeso")