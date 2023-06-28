import random

def openfile(filename):
    with open(filename) as f:
        file = f.read()
    
    return file

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
    ASCII_value = input_array.decode("utf-8", 'replace')
    return ASCII_value


# recebe uma string de bits porque ao passar ints ele retira os zeros a esquerda que aparecerem no inicio.
def simulatedBSC(seqOfBits, p):
    seqOfStr = str(seqOfBits)
    res = ""
    i = 0
    while i < len(seqOfStr):
        x = random.random()
        if x <= p:
            if seqOfStr[i] == '1':
                res += '0'
            else:
                res += '1'
        else:
            res += seqOfStr[i]
        i += 1
    return res


def countzerosOrOnes(seq, bit):  # seq:String,bit:Int
    i = 0
    res = 0
    while i < len(seq):

        if int(seq[i]) == bit:
            res += 1
        i += 1
    return res


f = str(input("File name: "))
open = openfile(f)
print("Sent Sequence:", open)

b = symbolToBinaryConversion(open)
print("Binary Sequence:", b)

bs = simulatedBSC(str(b), 0.1)
print("BSC:", bs)

d = binaryToSymbolConversion(str(bs))
print("Decoded Sequence:", d)

print(len(b))
zeros = countzerosOrOnes(b, 0)
ones = countzerosOrOnes(b, 1)
print(zeros)
print(ones)
zeros = countzerosOrOnes(bs, 0)
ones = countzerosOrOnes(bs, 1)
print("----------------")
print(zeros)
print(ones)