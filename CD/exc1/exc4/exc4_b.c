

#include <stdio.h>
#include <math.h>

long long print_bits(int);

int main() {
  int n, value;
  printf("Decimal Number: ");
  scanf("%d", &n);
  value = print_bits(n);
  printf("%d in decimal is %lld in binary", n, value);
  return 0;
}


long long print_bits(int n) {
  long long value = 0;
  int rem, i = 1;

  while (n!=0) {
    rem = n % 2;
    n /= 2;
    value += rem * i;
    i *= 10;
  }

  return value;
}