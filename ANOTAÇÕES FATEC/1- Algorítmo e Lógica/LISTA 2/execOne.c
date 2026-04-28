int main() {
    int opcao;

    do {
        printf("+-------------------------+\n");
        printf("|       MENU: PRATOS      |\n");
        printf("|                         |\n");
        printf("|                         |\n");
        printf("|      1. Strogonoff      |\n");
        printf("|      2. Nhoque          |\n");
        printf("|      3. Pizza           |\n");
        printf("|      4. Churrasco       |\n");
        printf("|                         |\n");
        printf("|                         |\n");
        printf("|    Escolha uma opcao    |\n");
        printf("|         5. Sair         |\n");
        printf("|                         |\n");
        printf("|                         |\n");
        printf("+-------------------------+\n\n");
        scanf("%d", &opcao);
        
        switch (opcao) {
            case 1:
                printf("Você escolheu Strogonoff.\n");
                printf("Esse é um prato Russo, e uma das melhores criações do mundo.\n");
                printf("Jajá eremos te servir.\n\n");
                break;
            case 2:
                printf("Você escolheu Nhoque.\n");
                printf("Jajá eremos te servir.\n\n");
                break;
            case 3:
                printf("Você escolheu Pizza.\n");
                printf("Jajá eremos te servir.\n\n");
                break;
            case 4:
                printf("Você escolheu Churrasco.\n");
                printf("Jajá eremos te servir.\n\n");
                break;
            case 5:
                printf("\nPrograma finalizado!\n\n");
                break;
            deafault:
                printf("Opção Inválida.\n\n");
        }
    } while (opcao != 5);

    return 0;
}