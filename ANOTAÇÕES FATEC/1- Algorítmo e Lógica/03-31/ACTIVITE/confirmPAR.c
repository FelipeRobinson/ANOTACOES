int main() {
    int a;

    printf("Digite um numero inteiro: ");
    scanf("%d", &a);

    if (((a % 2 == 0) && (a > 10)) || ((a % 2 != 0) && (a < 50))) {
        printf("SIM");
    }
    else {
        printf("NAO");
    }
}