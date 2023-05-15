import random
import string
import math
import array
import matplotlib.pyplot as plt
import numpy as np
from collections import Counter

def makeVernamCypher(plainText, theKey):
    cypherText = ''
    for i in range(len(plainText)):
        cypherChar = chr(ord(plainText[i]) ^ ord(theKey[i]))
        cypherText += cypherChar
    return cypherText


def getAllWords(filename):
    with open(filename) as file:
        file = file.read()
        print(file)
        with open("rand_cipher.txt", "w") as f1:
            chars = string.ascii_letters + string.digits
            size = len(file)
            seq = ''.join(random.choice(chars) for _ in range(size))
            cipher = makeVernamCypher(file, seq)
            f1.write(cipher)

        with open("const_cipher.txt", "w") as f2:
            const_key = "3" * len(file)
            print(const_key)
            cipher = makeVernamCypher(file, const_key)
            f2.write(cipher)

def counting_letters(filename):
    with open(filename) as f:
        letters_count = Counter(f.read())
    
    del letters_count[' ']
    del letters_count['\n']
    return letters_count

def plot_bar_from_counter(filename):
    frequencies = counting_letters(filename)
    information, entropy = calculate_information_entropy(frequencies)
    
    names = list(frequencies.keys())
    values = list(frequencies.values())
    info_values = [information[name] for name in names]

    x_coordinates = np.arange(len(names))
    fig, ax = plt.subplots()
    ax.bar(x_coordinates, values)
    
    ax.xaxis.set_major_locator(plt.FixedLocator(x_coordinates))
    ax.xaxis.set_major_formatter(plt.FixedFormatter(names))
    
    ax.set_xlabel("Symbols")
    ax.set_ylabel("Frequencies")
    ax.set_title("Histogram of " + filename)

    ax2 = ax.twinx()
    ax2.plot(x_coordinates, info_values, 'ro-', label='Information')  #o ro- Ã© para meter as bolas vermelhas
    ax2.set_ylabel("Information (bits)")

    ax.text(0.02, 0.90, "Entropy = {:.2f} bits/symbol".format(entropy), transform=ax.transAxes, verticalalignment='top')

    plt.legend()
    plt.show()

def calculate_information_entropy(frequencies):
    total_symbols = sum(frequencies.values())
    entropy = 0
    information = {}
    for symbol, count in frequencies.items():
        probability = count / total_symbols
        information[symbol] = -math.log2(probability)
        entropy += probability * information[symbol]
    return information, entropy


def main():
    getAllWords("a.txt")
    a = counting_letters("a.txt")
    b = counting_letters("rand_cipher.txt")
    c = counting_letters("const_cipher.txt")
    plot_bar_from_counter("a.txt")
    plot_bar_from_counter("rand_cipher.txt")
    plot_bar_from_counter("const_cipher.txt")
    calculate_information_entropy(a)
    calculate_information_entropy(b)
    calculate_information_entropy(c)
    
main()