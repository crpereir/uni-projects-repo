import random

def countErrors(receved,provided): #receve string,string -> return int
    if(len(receved) != len(provided)): 
        print("Error size of string receved and provided are diferente ")
    i = 0
    count = 0
    while i < len(receved):
        if receved[i] != provided[i]:
            count = count +1
        i= i+1
    return count

def calculateBer(nofError,size):
    return int(nofError)/int(size)

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


provided_10_1 = openfile("fileForBer10_1.txt")

providedBits_10_1 = symbolToBinaryConversion(provided_10_1)

recevedBits_10_1 = simulatedBSC(providedBits_10_1,0.1)

receved_10_1 = binaryToSymbolConversion(recevedBits_10_1)

nofError = countErrors(receved_10_1,provided_10_1)

Ber = calculateBer(nofError,len(receved_10_1))
print("Ber quando p é 10-1 = ")
print(Ber)
#---------------------------------------------------------------
provided_10_2 = openfile("fileForBer10_2.txt")

providedBits_10_2 = symbolToBinaryConversion(provided_10_2)

recevedBits_10_2 = simulatedBSC(providedBits_10_2,0.01)

receved_10_2 = binaryToSymbolConversion(recevedBits_10_2)

nofError = countErrors(receved_10_2,provided_10_2)

Ber = calculateBer(nofError,len(receved_10_2))
print("Ber quando p é 10-2 = ")
print(Ber)
#---------------------------------------------------------------
provided_10_3 = openfile("fileForBer10_3.txt")

providedBits_10_3 = symbolToBinaryConversion(provided_10_3)

recevedBits_10_3 = simulatedBSC(providedBits_10_3,0.001)

receved_10_3 = binaryToSymbolConversion(recevedBits_10_3)

nofError = countErrors(receved_10_3,provided_10_3)

Ber = calculateBer(nofError,len(receved_10_3))
print("Ber quando p é 10-3 = ")
print(Ber)
#---------------------------------------------------------------
provided_10_4 = openfile("fileForBer10_4.txt")

providedBits_10_4 = symbolToBinaryConversion(provided_10_4)

recevedBits_10_4 = simulatedBSC(providedBits_10_4,0.0001)

receved_10_4 = binaryToSymbolConversion(recevedBits_10_4)

nofError = countErrors(receved_10_4,provided_10_4)

Ber = calculateBer(nofError,len(receved_10_4))
print("Ber quando p é 10-4 = ")
print(Ber)
#---------------------------------------------------------------
provided_10_5 = openfile("fileForBer10_5.txt")

providedBits_10_5 = symbolToBinaryConversion(provided_10_5)

recevedBits_10_5 = simulatedBSC(providedBits_10_5,0.00001)

receved_10_5 = binaryToSymbolConversion(recevedBits_10_5)

nofError = countErrors(receved_10_5,provided_10_5)

Ber = calculateBer(nofError,len(receved_10_5))
print("Ber quando p é 10-5 = ")
print(Ber)
