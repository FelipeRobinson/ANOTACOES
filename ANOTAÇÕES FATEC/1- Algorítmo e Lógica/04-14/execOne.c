#include <stdio.h>

int main() {
    int div, n, eprimo;

    printf("Digite um n ́umero:");
    scanf("%d",&n);

    div = 2;
    eprimo=1;

    while (div <= n - 1) {
        if (n % div == 0) {
            eprimo=0;
        }
        div++;
    }
    if (eprimo) {
        printf("\n ́E primo!!\n");
    }
    else {
        printf("\nN~ao  ́e primo!!\n");
    }
}