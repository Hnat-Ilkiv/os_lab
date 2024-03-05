#include <stdio.h>
#include "../include/power.h"
#include "../include/factorial.h"

int main() {
    int a = 2;
    int b = 3;

    int result_power = power(a, b);
    int result_factorial = factorial(a);

    printf("%d^%d = %d\n", a, b, result_power);
    printf("%d! = %d\n", a, result_factorial);

    return 0;
}
