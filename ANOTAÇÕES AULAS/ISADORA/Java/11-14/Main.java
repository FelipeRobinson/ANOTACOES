// Leia 10 números inteiros e mostre quantos são pares e quantos são ímpares.

import java.until.Scanner;

public class Main {
    public static void main(String[] args) {
        int[] numbs = new int[10];

        for (int i = 0; i < numbs.length; i++) {
            Scanner sc = new Scanner(System.in);
            System.out.print("Digite um número inteiro: ");
            numbs[i] = sc.nextInt();
        }

        int pares = 0;
        int impares = 0;

        for (int n : numbs) {
            if (n % 2 == 0) {
                pares++;
            } 
            else {
                impares++;
            }
        }

        System.out.println("Quantidade de números pares: " + pares);
        System.out.println("Quantidade de números ímpares: " + impares);
    }
}