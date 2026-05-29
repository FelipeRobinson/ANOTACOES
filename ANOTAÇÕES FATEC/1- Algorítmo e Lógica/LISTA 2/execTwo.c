#include <stdio.h>

int main () {
    int a, b;
    int resultado = 1;

    printf("Escreva seu valor a ser elevado: \n");
    scanf("%d", &a);
    printf("Escreva seu valor de potencia: \n");
    scanf("%d", &b);

    // 
    for (int i = 1; i <= b; i++) {
        resultado *= a;
    }

    printf("%d ** %d = %d\n", a, b, resultado);
    return 0;
}