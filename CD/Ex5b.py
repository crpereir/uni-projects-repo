# falta colocar o bit stafin na matriz, mas não colocar na lista final
def interleaving(seqOfChars, matrizSize):
    print(len(seqOfChars))
    # colAndRow = math.sqrt(matrizSize)
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
    # print(mx)
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

    print(len(res))
    return res


il = interleaving("hello world12345", 4)
print(il)
