char tst_str0 [] = " 01011 ";
char tst_str1 [] = " 709 ";
char tst_str2 [] = "9 A0F ";

uint16_t tst_results [3] = { 11 , 457 , 39439 };

uint8_t error ;

uint16_t char2nat ( char symbol , uint16_t radix ) {

    uint16_t number = NAN ;

    if ( symbol >= '0 ' && symbol <= '9 ' ) {
        number = symbol - '0 ';
    } else if ( symbol >= 'A ' && symbol <= 'F ' ) {
        number = symbol - 'A ' + 10;
    }
    if ( radix > 16 || number >= radix ) {
        number = NAN ;
    }
    return number ;
}

uint16_t str2nat ( char numeral [] , uint16_t radix ) {

    uint16_t number = 0;
    int8_t error = 0;
    uint16_t idx , tmp ;

    for ( idx = 0; error == 0 && numeral [ idx ] != '\0 '; idx ++ ) {
        tmp = char2nat ( numeral [ idx ], radix );
        if ( tmp == NAN ) {
            number = NAN ;
            error = 1;
        } else {
        number = number * radix + tmp ;
        }
    }
    return number ;  
}

int main ( void ) {
    error = 0;

    if ( str2nat ( tst_str0 , 2 ) != tst_results [0] )
        error |= 1;
    if ( str2nat ( tst_str1 , 8 ) != tst_results [1] )
        error |= 2;
    if ( str2nat ( tst_str2 , 16 ) != tst_results [2] )
        error |= 4;
    return error ;
}