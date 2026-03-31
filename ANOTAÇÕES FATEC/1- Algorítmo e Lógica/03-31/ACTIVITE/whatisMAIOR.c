int main () {
    int x, y, z;

    printf("Digite um valor: ");
    scanf("%d", &x);
    printf("Digite outro valor: ");
    scanf("%d", &y);
    printf("Mais um valor diferente");
    scanf("%d", &z);

    if (x == y || x == z || z == y) {
        printf("Os valores precisam ser diferentes.");
        return 0;
    }

    if (x > y && x > z) {
        printf("O maior numero e: %d", x);
    }
    if (y > x && y > z) {
        printf("O maior numero e: %d", y);
    }
    else {
        printf("O maior numero e: %d", z);
    }
}