
#include <stdio.h>
#include <string.h>

void modify_style(char *str) {
    int i, j;
    for(i = 0, j = 0; str[i] != '\0'; i++) {
        if(str[i] == '_' && str[i+1] >= 'a' && str[i+1] <= 'z') {
            str[j] = str[i+1] - 32; // convert to uppercase
            i++; // skip the next character
        } else {
            str[j] = str[i];
        }
        j++;
    }
    str[j] = '\0'; // null terminate the string
}


int main() {
    char str1[] = "name_composed_by_words";
    modify_style(str1);
    printf("%s\n", str1); // should print "nameComposedByWords"

    char str2[] = "name_and_digit_2";
    modify_style(str2);
    printf("%s\n", str2); // should print "nameAndDigit_2"

    char str3[] = "TYPICAL_MACRO_NAME";
    modify_style(str3);
    printf("%s\n", str3); // should print "TYPICAL_MACRO_NAME"

    return 0;
}
