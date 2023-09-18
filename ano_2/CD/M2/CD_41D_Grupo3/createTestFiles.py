#def createFileForBer10_1():
#    f = open("fileForBer10_1.txt", "w")
#    f.write("abcdefghijklm")
#    f.close()

def createFileForBer10_1():
    write = ""
    i = 0
    while i < 125:
        write += str(i%10)
        i = i+1
    a = open("fileForBer10_1.txt", "w")
    a.write(write)
    a.close()

def createFileForBer10_2():
    write = ""
    i = 0
    while i < 1250:
        write += str(i%10)
        i = i+1
    a = open("fileForBer10_2.txt", "w")
    a.write(write)
    a.close()

def createFileForBer10_3():
    write = ""
    i = 0
    while i < 12500:
        write += str(i%10)
        i = i+1
    b = open("fileForBer10_3.txt", "w")
    b.write(write)
    b.close()

def createFileForBer10_4():
    write = ""
    i = 0
    while i < 125000:
        write += str(i%10)
        i = i+1
    b = open("fileForBer10_4.txt", "w")
    b.write(write)
    b.close()

def createFileForBer10_5():
    write = ""
    i = 0
    while i < 1250000:
        write += str(i%10)
        i = i+1
    b = open("fileForBer10_5.txt", "w")
    b.write(write)
    b.close()

def openfile(filename):
    with open(filename) as f:
        file = f.read()
    
    return file

createFileForBer10_1()
createFileForBer10_2()
createFileForBer10_3()
createFileForBer10_4()
createFileForBer10_5()

print(openfile("fileForBer10_1.txt"))