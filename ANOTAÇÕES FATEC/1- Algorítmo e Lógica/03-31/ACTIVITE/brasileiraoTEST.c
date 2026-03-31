int main () {
    int vict_a, vict_b, saldo_a, saldo_b, gols_a, gols_b, red_a, red_b, yellow_a, yellow_b;

    char a_vence[] = "O time que segue o compeonato e o A";
    char b_vence[] = "O time que segue o compeonato e o B";

    printf("Bem vindo ao leitor de desempate.\n");
    printf("Iremos solicitar algumas informacoes para continuar: \n");

    printf("Qual o numero de vitorias do time A: ");
    scanf("%d", &vict_a);
    printf("Qual o numero de vitorias do time B: ");
    scanf("%d", &vict_b);

    if (vict_a > vict_b) {
        printf("%s\n", a_vence);
    }
    else if (vict_a < vict_b) {
        printf("%s\n", b_vence);
    }
    else {
        printf("Qual o saldo de gols do time A: ");
        scanf("%d", &saldo_a);
        printf("Qual o saldo de gols do time B: ");
        scanf("%d", &saldo_b);

        if (saldo_a > saldo_b) {
            printf("%s\n", a_vence);
        }
        else if (saldo_a < saldo_b) {
            printf("%s\n", b_vence);
        }
        else {
            printf("Qual o numero de gols do time A: ");
            scanf("%d", &gols_a);
            printf("Qual o numero de gols do time B: ");
            scanf("%d", &gols_b);

            if (gols_a > gols_b) {
                printf("%s\n", a_vence);
            }
            else if (gols_a < gols_b) {
                printf("%s\n", b_vence);
            }
            else {
                printf("Qual o numero de cartoes vermelhos do time A: ");
                scanf("%d", &red_a);
                printf("Qual o numero de cartoes vermelhos do time B: ");
                scanf("%d", &red_b);

                if (red_a < red_b ) {
                    printf("%s\n", a_vence);
                }
                else if (red_a > red_b) {
                    printf("%s\n", b_vence);
                }
                else {
                    printf("Qual o numero de cartes amarelos do time A: ");
                    scanf("%d", &yellow_a);
                    printf("Qual o numero de cartoes amarelos do time B: ");
                    scanf("%d", &yellow_b);

                    if (yellow_a < yellow_b) {
                        printf("%s\n", a_vence);
                    }
                    else {
                        printf("%s\n", b_vence);
                    }
                }
            }
        }
    }
}