from __future__ import print_function
import random

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

def interleaving(seqOfChars, matrizSize):
    mx = []
    elem = 0
    i = 0
    y = 0
    while i < matrizSize:
        linha = []
        y = 0
        while y < matrizSize:
            if len(seqOfChars) > elem:
                linha.append(seqOfChars[elem])
            else:
                linha.append(' ')
            elem += 1
            y += 1
        mx.append(linha)
        i += 1
    i = 0
    y = 0
    res = ""
    while i < matrizSize:
        y = 0
        while y < matrizSize:
            if len(seqOfChars) > len(res):
                res = res + mx[y][i]
            y += 1
        i += 1
    return res

print("In order to write the file's name, use " + chr(34) + "_filename_.txt" + chr(34))

f = str(input("File name: "))
open = openfile(f)
print(open)

l = interleaving(open, 100)
print("Interleaving:", l)

b = turnBinary(l)
print("Binary Sequence:", b)

r = convertRep3_1(b)
print("Encoded Sequence:", r)

bs = simulatedBSC(int(r), 0.1)
print("BSC:", bs)

d = decodeRep3_1(str(bs))
print("Decoded Sequence:", d)

di = interleaving(d, 100)
print("De-Interleaving:", di)

def countzerosOrOnes(seq, bit):
    i = 0
    res = 0
    while i < len(seq):
        if int(seq[i]) == bit:
            res += 1
        i += 1
    return res

print(len(r))
zeros = countzerosOrOnes(r, 0)
ones = countzerosOrOnes(r, 1)
print(zeros)
print(ones)
zeros = countzerosOrOnes(str(bs), 0)
ones = countzerosOrOnes(str(bs), 1)
print("----------------")
print(zeros)
print(ones)

print("----------------")
print(l)
print(len(di))