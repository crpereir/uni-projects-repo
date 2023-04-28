
/*
/*, a qual retorna o símbolo mais frequente do ficheiro
de texto file_name. A função imprime na consola o número de vezes que esse símbolo ocorre no ficheiro.*/

/*char most_frequent_symbol(char *file_name)
{
   
    int arrayOfCharFrequency[256] = {0};

    size_t sizeArray = sizeof(arrayOfCharFrequency) / sizeof(arrayOfCharFrequency[0]); // sizeOf(a) devolve o tamanho em bytes e como cada caracter tem o mesmo tamanho divide-se por sizeOf(a[0]) que devolve o tamanho em bytes do primero elemento do array
    fp = fopen(file_name, "r");                                                        //"r" -> significa que estamos no modo de leitura fopen recebe nome do ficheiro e modo

    if (fp == NULL)
    {
        printf("impossivel de ler ficheiro %d", file_name);
        return ' ';
    }

    do
    {
        int charValue = fgetc(fp);            // retorna o char que se encontra no ficheiro escrito em fopen e localizado em fp
        arrayOfCharFrequency[charValue] += 1; // incrementa a frequencia que o char apareceu até agora
    } while (feof(fp) == 0);

    fclose(fp); // fecha a leitura ao ficheiro

    for (size_t i = 0; i < sizeArray; i++) // for para descobrir o char que apareceu mais vezes
    {
        currentCharFrequency = arrayOfCharFrequency[i];
        if (currentCharFrequency > bestCharFrequency)
        {
            bestCharFrequency = currentCharFrequency;
            bestChar = i;
        }
    }

    printf("n de vezes que %c aparece : %d \n", bestChar, bestCharFrequency);

    
    return bestChar;
}

*/