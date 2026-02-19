print("POROGRAMA P/ANALISAR LUCRO MENTAL\n")

m=1

while True:
    lm=0.1/(0.1+2.71**4-0.2*m)
    im=0.3*2.71**1-3*m
    if lm>im:
        print("O lucro a partir do mes", m ,"e maior que o investimento")
        break
    else:
        m=+1