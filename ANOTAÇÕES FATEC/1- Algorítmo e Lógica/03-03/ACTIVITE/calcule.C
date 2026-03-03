// Ler e rodar um programa onde ele faça o cálculo da área de um retângulo //

int main() {
    int largura, comprimento;

    printf("Digite a largura: ");
    scanf("%d", &largura);

    printf("Digite o comprimento: ");
    scanf("%d", &comprimento);

    const area = comprimento * largura;

    printf("%dA área do seu retângulo é: ", area);
}


// CORREÇÃO //

int main() {
    int base, altura, area;

    printf("Digite o valor da base: ");
    scanf("%d", &base);

    printf("Digite o valor da altura: ");
    scanf("%d", &altura);
    
    area = base * altura;

    printf("Area = %d\n", area);
}