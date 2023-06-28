from __future__ import print_function
import random

#Repeticao (3,1)

def openfile(filename):
    with open(filename) as f:
        file = f.read()
    
    return file

def turnBinary(filewords):
    binaryword = ''
    for w in filewords:
        for i in range(len(w)):
            ascii = int(ord(w[i]))
            binary = bin(ascii) [2:]
            fillUp = fillUpto8bits(binary)
            binary = fillUp + str(binary)
            binaryword += binary
    return binaryword

def fillUpto8bits(sequence):
    #print(sequence)
    fill = ''
    l = len(sequence)
    #print(l)
    while (l < 8):
        fill += '0'
        l += 1
    return fill

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
    return str(res)

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

def turnCharacter(binarySeq):
    characterSeq = ''
    i = 0
    while (i < len(binarySeq)):
        bits = str(binarySeq[i] + binarySeq[i + 1] + binarySeq[i + 2] + binarySeq[i + 3] + binarySeq[i + 4] + 
                  binarySeq[i + 5] + binarySeq[i + 6] + binarySeq[i + 7])
        character = chr(int(bits, 2))
        characterSeq += character
        i += 8
    return characterSeq

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

b = turnBinary(open)
print("Binary Sequence:", b)

r = convertRep3_1(b)
print("Encoded Sequence:", r)

bs = simulatedBSC(str(r), 0.01)
print("BSC:", bs)

d = decodeRep3_1(str(bs))
print("Decoded Sequence:", d)

c = turnCharacter(d)
print("Received Sequence:", c)


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