#include <stdio.h>

int main() {
    int r;

    r = soma(10, 20);
    printf("%d", r);
}

int soma (int a, int b) {
    int c;

    c = a + b;
    return c;
}