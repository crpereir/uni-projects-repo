def makeVernamCypher(plainText, theKey):
    cypherText = ''
    for i in range(len(plainText)):
        cypherChar = chr(ord(plainText[i]) ^ ord(theKey[i]))
        cypherText += cypherChar
    return cypherText

text_test = "abcabcd"
const_key = "3333333"

ciphertext = makeVernamCypher(text_test, const_key)
print("Texto cifrado:", ciphertext)

deciphertext = makeVernamCypher(ciphertext, const_key)
print("Texto decifrado:", deciphertext)