import math
import matplotlib.pyplot as plt
import numpy as np
from collections import Counter

filename = "alice29.txt"


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
    ax2.plot(x_coordinates, info_values, 'ro-', label='Information')  #o ro- é para meter as bolas vermelhas
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



plot_bar_from_counter(filename)
