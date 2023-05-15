import os
import math
from collections import Counter

import matplotlib.pyplot as plt

filename = "alice.txt"


def histogram(filename):
    with open (filename) as f:
        symbol_count = Counter(f.read())
    
    total_symbols = sum(symbol_count.values())
    symbol_prob = {symbol: count/total_symbols for symbol, count in symbol_count.items()}
    symbol_info = {symbol: -math.log2(prob) for symbol, prob in symbol_prob.items()}
    
    entropy = sum(prob * info for symbol, prob in symbol_prob.items() for info in [symbol_info[symbol]])
    
    fig, ax1 = plt.subplots()
    ax1.bar(symbol_count.keys(), symbol_count.values())
    ax1.set_title('Histogram of '+ filename)
    ax1.set_xlabel('Symbol')
    ax1.set_ylabel('Count')
    
    # Adiciona a informação própria ao gráfico
    ax2 = ax1.twinx()
    info_values = [symbol_info[symbol] for symbol in symbol_count.keys()]
    x_coordinates = list(range(len(symbol_count)))
    ax2.plot(x_coordinates, info_values, 'ro-', label='Information')
    ax2.set_ylabel("Information (bits)")

    plt.text(0.05, 0.95, f'Entropy: {entropy:.2f} bits', transform=ax1.transAxes)

    plt.show()

histogram("alice29.txt")
