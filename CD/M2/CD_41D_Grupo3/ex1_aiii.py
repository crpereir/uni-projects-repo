import random

def openfile(filename):
    with open(filename) as f:
        file = f.read()

    return file

def symbolToBinaryConversionHamming(string):
    binary_list = []

    for char in string:
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
    return ''.join(binary_list)

def binaryToSymbolConversion(seqOfBits):
    input_string = int(str(seqOfBits), 2)
    Total_bytes = (input_string.bit_length() + 7) // 8
    input_array = input_string.to_bytes(Total_bytes, "big")
    ASCII_value = input_array.decode("utf-8", 'replace')
    return ASCII_value

def BinaryTosymbolConversionHamming(seqOfBits):
    binary_list = []
    charBits = ""
    bitsWithoutStuffing = ""
    for bit in str(seqOfBits):
        charBits += bit
        if len(charBits) == 14:
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

            sindroma = XorBitsString((charBits[4:7:1]), bH)
            if sindroma != '000':
                CorrecthigherfourBitsStr = ErrorCorrection(
                    sindroma, higherfourBitsStr)
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
            sindroma = XorBitsString((charBits[11:14:1]), bL)
            if sindroma != '000':
                CorrectlowerfourBitsStr = ErrorCorrection(
                    sindroma, lowerfourBitsStr)
            else:
                CorrectlowerfourBitsStr = lowerfourBitsStr
            charBits = CorrecthigherfourBitsStr[0:4:1]
            charBits += CorrectlowerfourBitsStr[0:4:1]
            bitsWithoutStuffing += charBits
            charBits = ""
    res = binaryToSymbolConversion(bitsWithoutStuffing)

    return res

def XorBitsToOne(BitsStr):
    result = 0
    y = 0
    while y < len(BitsStr):
        result = result ^ int(BitsStr[y])
        y = y+1
    return result

def XorBitsString(BitsStr1, BitsStr2):
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
    res = ''.join(format(i, '08b')
                  for i in bytearray(seqOfChars, encoding='utf-8'))
    return res

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

r = symbolToBinaryConversionHamming(open)
print("Encoded Sequence:", r)

bs = simulatedBSC(str(r), 0.01)
print("BSC:", bs)

d = BinaryTosymbolConversionHamming(str(bs))
print("Decoded Sequence:", d)

print(len(r))
zeros = countzerosOrOnes(r, 0)
ones = countzerosOrOnes(r, 1)
print(zeros)
print(ones)
zeros = countzerosOrOnes(bs, 0)
ones = countzerosOrOnes(bs, 1)
print("----------------")
print(zeros)
print(ones)