from __future__ import print_function
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

#--------------------------------------------------------------
provided_10_1 = openfile("fileForBer10_1.txt")

providedBits_10_1 = turnBinary(provided_10_1)

encodedProvidedBits_10_1 = convertRep3_1(providedBits_10_1)

receivedBits_10_1 = simulatedBSC(str(encodedProvidedBits_10_1), 0.1)

decodedReceivedBits_10_1 = decodeRep3_1(str(receivedBits_10_1))

received_10_1 = turnCharacter(decodedReceivedBits_10_1)

nofError = countErrors(received_10_1,provided_10_1)

Ber = calculateBer(nofError,len(received_10_1))
print("Ber quando p é 10-1 = ")
print(Ber)
#--------------------------------------------------------------
provided_10_2 = openfile("fileForBer10_2.txt")

providedBits_10_2 = turnBinary(provided_10_2)

encodedProvidedBits_10_2 = convertRep3_1(providedBits_10_2)

receivedBits_10_2 = simulatedBSC(str(encodedProvidedBits_10_2), 0.01)

decodedReceivedBits_10_2 = decodeRep3_1(str(receivedBits_10_2))

received_10_2 = turnCharacter(decodedReceivedBits_10_2)

nofError = countErrors(received_10_2,provided_10_2)

Ber = calculateBer(nofError,len(received_10_2))
print("Ber quando p é 10-2 = ")
print(Ber)
#--------------------------------------------------------------
provided_10_3 = openfile("fileForBer10_3.txt")

providedBits_10_3 = turnBinary(provided_10_3)

encodedProvidedBits_10_3 = convertRep3_1(providedBits_10_3)

receivedBits_10_3 = simulatedBSC(str(encodedProvidedBits_10_3), 0.001)

decodedReceivedBits_10_3 = decodeRep3_1(str(receivedBits_10_3))

received_10_3 = turnCharacter(decodedReceivedBits_10_3)

nofError = countErrors(received_10_3,provided_10_3)

Ber = calculateBer(nofError,len(received_10_3))
print("Ber quando p é 10-3 = ")
print(Ber)
#--------------------------------------------------------------
provided_10_4 = openfile("fileForBer10_4.txt")

providedBits_10_4 = turnBinary(provided_10_4)

encodedProvidedBits_10_4 = convertRep3_1(providedBits_10_4)

receivedBits_10_4 = simulatedBSC(str(encodedProvidedBits_10_4), 0.0001)

decodedReceivedBits_10_4 = decodeRep3_1(str(receivedBits_10_4))

received_10_4 = turnCharacter(decodedReceivedBits_10_4)

nofError = countErrors(received_10_4,provided_10_4)

Ber = calculateBer(nofError,len(received_10_4))
print("Ber quando p é 10-4 = ")
print(Ber)
#--------------------------------------------------------------
provided_10_5 = openfile("fileForBer10_5.txt")

providedBits_10_5 = turnBinary(provided_10_5)

encodedProvidedBits_10_5 = convertRep3_1(providedBits_10_5)

receivedBits_10_5 = simulatedBSC(str(encodedProvidedBits_10_5), 0.00001)

decodedReceivedBits_10_5 = decodeRep3_1(str(receivedBits_10_5))

received_10_5 = turnCharacter(decodedReceivedBits_10_5)

nofError = countErrors(received_10_5,provided_10_5)

Ber = calculateBer(nofError,len(received_10_5))
print("Ber quando p é 10-5 = ")
print(Ber)