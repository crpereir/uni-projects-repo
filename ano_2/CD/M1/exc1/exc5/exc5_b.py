# Função que determina o máximo divisor comum entre dois números inteiros a e b, através do algoritmo de Euclides.

import random


def maxDivisor(a, b):
    if b == 0:  # quando b = 0 chegamos ao MDC(a,b)
        return a
    else:
        return maxDivisor(b, a % b)  # MDC(a,b) = MDC(b,r)


x = maxDivisor(27, 3)
y = maxDivisor(50, 20)
print(x, y)  # testes expected x = 3 y = 10

