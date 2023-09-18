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

def symbolToBinaryConversionHamming(string):
    # Initialize empty list to store binary values
    binary_list = []

    # Iterate through each character in the string
    for char in string:
        # Convert character to binary, pad with leading zeroes and append to list
        charBits = symbolToBinaryConversion(char)
        loops = len(charBits)//8
        i = 0

        res = ""
        while i < loops:
            higherfourBitsStr = charBits[(i*8):((i*8)+4):1]
            lowerfourBitsStr = charBits[((i*8)+4):((i+1)*8):1]
            bH0 = str(int(higherfourBitsStr[1]) ^ int(
                higherfourBitsStr[2]) ^ int(higherfourBitsStr[3]))
            bH1 = str(int(higherfourBitsStr[0]) ^ int(
                higherfourBitsStr[1]) ^ int(higherfourBitsStr[3]))
            bH2 = str(int(higherfourBitsStr[0]) ^ int(
                higherfourBitsStr[2]) ^ int(higherfourBitsStr[3]))
            bH = bH0
            bH += bH1
            bH += bH2
            higherfourBitsStr += bH
            bL0 = str(int(lowerfourBitsStr[1]) ^ int(
                lowerfourBitsStr[2]) ^ int(lowerfourBitsStr[3]))
            bL1 = str(int(lowerfourBitsStr[0]) ^ int(
                lowerfourBitsStr[1]) ^ int(lowerfourBitsStr[3]))
            bL2 = str(int(lowerfourBitsStr[0]) ^ int(
                lowerfourBitsStr[2]) ^ int(lowerfourBitsStr[3]))
            bL = bL0
            bL += bL1
            bL += bL2
            lowerfourBitsStr += bL
            res += higherfourBitsStr
            res += lowerfourBitsStr
            i = i+1

        binary_list.append(res)
    # Join the binary values in the list and return as a single string
    return ''.join(binary_list)

def BinaryTosymbolConversionHamming(seqOfBits):
    # Initialize empty list to store binary values
    binary_list = []
    charBits = ""
    bitsWithoutStuffing = ""
    # Iterate through each character in the string
    for bit in str(seqOfBits):
        # Convert character to binary, pad with leading zeroes and append to list
        charBits += bit
        if len(charBits) == 14:
            # string[start:end:step] start idx começo, end idx final que não é incluido na lista, step retira o caracter da lista criada
            higherfourBitsStr = charBits[0:4:1]
            lowerfourBitsStr = charBits[7:11:1]

            bH0 = str(int(higherfourBitsStr[1]) ^ int(
                higherfourBitsStr[2]) ^ int(higherfourBitsStr[3]))

            bH1 = str(int(higherfourBitsStr[0]) ^ int(
                higherfourBitsStr[1]) ^ int(higherfourBitsStr[3]))
            bH2 = str(int(higherfourBitsStr[0]) ^ int(
                higherfourBitsStr[2]) ^ int(higherfourBitsStr[3]))
            bH = bH0
            bH += bH1
            bH += bH2
            # higherfourBitsStr += bH
            # comparar os valores altos aqui
            # testar esses valores
            sindroma = XorBitsString((charBits[4:7:1]), bH)
            if sindroma != '000':
                CorrecthigherfourBitsStr = ErrorCorrection(
                    sindroma, higherfourBitsStr)  # nota fazer função aux para xor
            else:
                CorrecthigherfourBitsStr = higherfourBitsStr
            bL0 = str(int(lowerfourBitsStr[1]) ^ int(
                lowerfourBitsStr[2]) ^ int(lowerfourBitsStr[3]))

            bL1 = str(int(lowerfourBitsStr[0]) ^ int(
                lowerfourBitsStr[1]) ^ int(lowerfourBitsStr[3]))
            bL2 = str(int(lowerfourBitsStr[0]) ^ int(
                lowerfourBitsStr[2]) ^ int(lowerfourBitsStr[3]))
            bL = bL0
            bL += bL1
            bL += bL2
            # lowerfourBitsStr += bL
            # comparar os valores baixos aqui
            sindroma = XorBitsString((charBits[11:14:1]), bL)
            if sindroma != '000':  # nota esta errado porque a função compara 8 bits de cada vez em vez de 4
                CorrectlowerfourBitsStr = ErrorCorrection(
                    sindroma, lowerfourBitsStr)  # nota fazer função aux para xor
            else:
                CorrectlowerfourBitsStr = lowerfourBitsStr
            charBits = CorrecthigherfourBitsStr[0:4:1]
            charBits += CorrectlowerfourBitsStr[0:4:1]
            bitsWithoutStuffing += charBits
            charBits = ""
    res = binaryToSymbolConversion(bitsWithoutStuffing)

    # Join the binary values in the list and return as a single string
    return res

def XorBitsString(BitsStr1, BitsStr2):  # recebe string,string -> retorna string
    result = ""
    size = 0
    if len(BitsStr1) >= len(BitsStr2):
        size = len(BitsStr2)
    else:
        size = len(BitsStr1)
    y = 0
    while y < size:
        result += str(int(BitsStr2[y]) ^ int(BitsStr1[y]))
        y = y+1
    return result


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

# recebe string,string -> retorna string


def ErrorCorrection(sindroma, SevenBitsStr):
    sindromaTable = {'011': '1000000', '110': '0100000', '101': '0010000',
                     '111': '0001000', '100': '0000100', '010': '0000010', '001': '0000001'}
    erroPos = sindromaTable[sindroma]
    i = 0
    result = ""
    while i < len(SevenBitsStr):
        bit = (int(SevenBitsStr[i]) ^ int(erroPos[i]))
        result += str(bit)
        i = i+1
    return result


t4 = XorBitsString("0000", "1111")
# print(t4)
# print("\n")

t3 = ErrorCorrection('010', '1111111')

# print(t3)
# print("\n")


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

#--------------------------------------------------------------
provided_10_1 = openfile("fileForBer10_1.txt")

providedCodedBits_10_1 = symbolToBinaryConversionHamming(provided_10_1) 

receivedBits_10_1 = simulatedBSC(providedCodedBits_10_1, 0.1)

received_10_1 = BinaryTosymbolConversionHamming(str(receivedBits_10_1))

nofError = countErrors(received_10_1,provided_10_1)

Ber = calculateBer(nofError,len(received_10_1))
print("Ber quando p é 10-1 = ")
print(Ber)
#--------------------------------------------------------------
provided_10_2 = openfile("fileForBer10_2.txt")

providedCodedBits_10_2 = symbolToBinaryConversionHamming(provided_10_2) 

receivedBits_10_2 = simulatedBSC(providedCodedBits_10_2, 0.01)

received_10_2 = BinaryTosymbolConversionHamming(str(receivedBits_10_2))

nofError = countErrors(received_10_2,provided_10_2)

Ber = calculateBer(nofError,len(received_10_2))
print("Ber quando p é 10-2 = ")
print(Ber)
#--------------------------------------------------------------
provided_10_3 = openfile("fileForBer10_3.txt")

providedCodedBits_10_3 = symbolToBinaryConversionHamming(provided_10_3) 

receivedBits_10_3 = simulatedBSC(providedCodedBits_10_3, 0.001)

received_10_3 = BinaryTosymbolConversionHamming(str(receivedBits_10_3))

nofError = countErrors(received_10_3,provided_10_3)

Ber = calculateBer(nofError,len(received_10_3))
print("Ber quando p é 10-3 = ")
print(Ber)
#--------------------------------------------------------------
provided_10_4 = openfile("fileForBer10_4.txt")

providedCodedBits_10_4 = symbolToBinaryConversionHamming(provided_10_4) 

receivedBits_10_4 = simulatedBSC(providedCodedBits_10_4, 0.0001)

received_10_4 = BinaryTosymbolConversionHamming(str(receivedBits_10_4))

nofError = countErrors(received_10_4,provided_10_4)

Ber = calculateBer(nofError,len(received_10_4))
print("Ber quando p é 10-4 = ")
print(Ber)
#--------------------------------------------------------------
provided_10_5 = openfile("fileForBer10_5.txt")

providedCodedBits_10_5 = symbolToBinaryConversionHamming(provided_10_5) 

receivedBits_10_5 = simulatedBSC(providedCodedBits_10_5, 0.00001)

received_10_5 = BinaryTosymbolConversionHamming(str(receivedBits_10_5))

nofError = countErrors(received_10_5,provided_10_5)

Ber = calculateBer(nofError,len(received_10_5))
print("Ber quando p é 10-5 = ")
print(Ber)

