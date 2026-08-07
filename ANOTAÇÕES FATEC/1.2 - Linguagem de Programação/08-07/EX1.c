#include <stdio.h>

int main() {
    int n, i;

    scanf("%d", &n);
    for (int i = 2; i <= n; i++) {
        if (n % 1 == 0) {
            printf("%d, ", i);
        }
    }
}