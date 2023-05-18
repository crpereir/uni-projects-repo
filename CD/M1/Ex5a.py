import random


def simulatedBSC(seqOfBits, p):
    i = seqOfBits
    i, res = divmod(i, 10)  # recebe o primeiro valor
    while i > 0:
        i, digit = divmod(i, 10)
        # print(digit)
        # print(i)
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


def countzerosOrOnes(seq, bit):
    i = seq
    res = 0
    while i > 0:
        i, digit = divmod(i, 10)
        if digit == bit:
            res += 1
    return res


seq = 1111111111
p = 0.5
z = ex5(seq, p)
print(z)
expectedzeros = 5
atualzeros = countzerosOrOnes(z, 0)
print(atualzeros)
expectedones = 5
atualones = countzerosOrOnes(z, 1)
print(atualones)
