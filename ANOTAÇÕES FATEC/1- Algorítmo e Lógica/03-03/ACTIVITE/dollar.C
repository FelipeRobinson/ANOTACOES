int main() {
    float  real, convert, dollar;    
    dollar = 5.24;
    // variáveis

    printf("Digite seu valor em real: R$");
    scanf("%f", &real);
    // requerimento
    
    convert = real * dollar;
    // ação de trabalho
    
    printf("Seu valor em dollar: $%f\n", convert);
    // resultado esperado
}