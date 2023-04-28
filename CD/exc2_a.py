import os
import math
from collections import Counter

import matplotlib.pyplot as plt



# Itera sobre todos os arquivos do diretório
def histogram(filename):
    with open (filename) as f:
        symbol_counts = Counter(f.read())
    
    
    # Calcula a probabilidade de cada símbolo
    total_symbols = sum(symbol_counts.values())

    symbol_probs = {symbol: count/total_symbols for symbol, count in symbol_counts.items()}
    
    # Calcula a informação própria de cada símbolo
    symbol_infos = {symbol: -math.log2(prob) for symbol, prob in symbol_probs.items()}
    
    # Calcula a entropia do arquivo
    entropy = sum(prob * info for symbol, prob in symbol_probs.items() for info in [symbol_infos[symbol]])
    

    # Plot do histograma
    plt.bar(symbol_counts.keys(), symbol_counts.values())
    plt.title('Histogram')
    plt.xlabel('Symbol')
    plt.ylabel('Count')
    plt.show()


    # Imprime os resultados
    print(f'File: {filename}')
    print(f'Count: {symbol_counts}')
    print(f'Probabilidade: {symbol_probs}')
    print(f'Info própria: {symbol_infos}')
    print(f'Entropia: {entropy}\n')


histogram("alice29.txt")