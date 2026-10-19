
#include <stdio.h>
#include <limits.h>

int main(void) {
    int a = INT_MAX;
    int b = 1;

    printf("%d + %d\n", a, b);
    printf("Result: %d\n", a + b); // Undefined behavior!
    return 0;
}

