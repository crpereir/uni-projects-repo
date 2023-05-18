# falta a leitura do ficheiro, fazer duas funções aux para ler e escrever.
def symbolToBinaryConversion(seqOfChars):
    # using join() + bytearray() + format()
    # Converting String to binary
    res = ''.join(format(i, '08b')
                  for i in bytearray(seqOfChars, encoding='utf-8'))
    return res


def binaryToSymbolConversion(seqOfBits):
    input_string = int(str(seqOfBits), 2)
    # Obtain the total number of bytes
    Total_bytes = (input_string.bit_length() + 7) // 8

    # Convert these bits to bytes
    input_array = input_string.to_bytes(Total_bytes, "big")

    # Convert the bytes to an ASCII value and display it on the output screen
    ASCII_value = input_array.decode()
    return ASCII_value


t1 = symbolToBinaryConversion("hello")
print(t1)
t1a = binaryToSymbolConversion(t1)
print(t1a)
