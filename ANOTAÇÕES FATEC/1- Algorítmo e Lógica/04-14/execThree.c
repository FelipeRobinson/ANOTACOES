#include <stdio.h>

int main () {
    int n;

    printf("Escreva um numero inteiro: \n");
    scanf("%d", &n);
    
    for (int j = 1; j <=n; j++) {
        printf("%d \n", j);
    }
}