from __future__ import print_function
import random

# Repetição (3,1)

def openfile(filename):
    with open(filename) as f:
        file = f.read().split(' ')
    
    return file

def turnBinary(filewords):
    binaryword = ''
    for w in filewords:
        for i in range(len(w)):
            ascii = int(ord(w[i]))
            binary = bin(ascii) [2:]
            binaryword += str(binary)
    return binaryword

def convertRep3_1(binaryseq):
    convert = ''
    for i in range(len(binaryseq)):
        if binaryseq[i] == '1':
            convert += str(111)
        elif binaryseq[i] == '0': 
            convert += str(0)
            convert += str(0)
            convert += str(0)
    return convert

def simulatedBSC(seqOfBits, p):
    i = seqOfBits
    i, res = divmod(i, 10)
    while i > 0:
        i, digit = divmod(i, 10)
        x = random.random()
        if x <= p:
            if digit == 1:
                res = numConcat(res, 0)
            else:
                res = numConcat(res, 1)
        else:
            res = numConcat(res, digit)
    return res

def numConcat(num1, num2):
    num1 = str(num1)
    num2 = str(num2)
    num1 += num2
    return int(num1)

def decodeRep3_1(binaryseq):
    simplesequence = ''
    i = 0
    while(i in range(len(binaryseq) - 2)):
        compare = binaryseq[i]
        if (binaryseq[i + 1] == compare and binaryseq[i + 2] == compare): 
            simplesequence += str(compare)
        elif (binaryseq[i + 1] != compare and binaryseq[i + 2] == compare or 
              binaryseq[i + 1] == compare and binaryseq[i + 2] != compare):
            simplesequence += str(compare)
        elif (binaryseq[i + 1] != compare and binaryseq[i + 2] != compare):
            simplesequence += str(binaryseq[i + 1])
        i += 3
    return simplesequence

f = str(input("File name: "))
open = openfile(f)
print(open)

b = turnBinary(open)
print("Binary Sequence:", b)

r = convertRep3_1(b)
print("Encoded Sequence:", r)

bs = simulatedBSC(int(r), 0.1)
print("BSC:", bs)

d = decodeRep3_1(str(bs))
print("Decoded Sequence", d)