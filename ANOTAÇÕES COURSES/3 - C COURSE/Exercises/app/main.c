#include <stdio.h>

int main() {
   vect();
   return 0;
}

int vect() {
    int a;

    printf("Qual o tamanho do seu vetor: ");
    scanf("%d", &a);

    int v[a];
    for (int i = 0; i < a; i++) {
        printf("Digite o valor irá no endereço %d do vetor: ", i);
        scanf("%d", &v[i]);
    }

    for (int i = 0; i < a; i++) {
        for (int j = 0; j < a; j++) {
            if (v[i] < v[j]) {
                int change = v[i];
	            v[i] = v[j];
                v[j] = change;
            }
        }
    }

    printf("O seu vetor ordenado é: ");
    for (int i = 0; i < a; i++) {
        printf("%d, ", v[i]);
    }
}