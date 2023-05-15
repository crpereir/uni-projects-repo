

import math


def symbol_frequency(file_path):
    frequencies = {}
    total_symbols = 0
    with open(file_path, "r") as f:
        for line in f:
            for symbol in line:
                if symbol in frequencies:
                    frequencies[symbol] += 1
                else:
                    frequencies[symbol] = 1
                total_symbols += 1
    for symbol, frequency in frequencies.items():
        frequencies[symbol] = frequency / total_symbols
    return frequencies



def entropy(file_path):
    frequencies = symbol_frequency(file_path)
    H = 0
    for frequency in frequencies.values():
        H -= frequency * math.log2(frequency)
    return H



en_frequencies = symbol_frequency("ListaPalavrasEN.txt")
print("English symbol frequencies:")
for symbol, frequency in sorted(en_frequencies.items()):
    print(f"{symbol}: {frequency:.2%}")


en_entropy = entropy("ListaPalavrasEN.txt")
print(f"English entropy: {en_entropy:.2f}")


pt_frequencies = symbol_frequency("ListaPalavrasPT.txt")
print("Portuguese symbol frequencies:")
for symbol, frequency in sorted(pt_frequencies.items()):
    print(f"{symbol}: {frequency:.2%}")


pt_entropy = entropy("ListaPalavrasPT.txt")
print(f"Portuguese entropy: {pt_entropy:.2f}")
