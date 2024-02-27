// factorial.c
#include "../include/factorial.h"

int factorial(int a) {
    if (a == 0 || a == 1) {
        return 1;
    } else {
        return a * factorial(a - 1);
    }
}

