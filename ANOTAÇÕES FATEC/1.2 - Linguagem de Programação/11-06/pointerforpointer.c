#include <stdio.h>
#include <stdlib.h>

int main() {
    int **p, i;

    p = calloc (5, sizeof(int ∗));

    for (i = 0; i < 5; i++) {
        p[i] = calloc (3, sizeof(int));
    }
    
    return 0;
}