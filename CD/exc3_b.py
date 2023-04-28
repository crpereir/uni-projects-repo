import numpy as np
from collections import Counter


M = 4 #tamanho do alfabeto
Ns = [10, 100, 1000] #tamanho das sequências

for N in Ns:
    seq = np.random.randint(M, size=N)  #gero a sequencia
    
    #calculo a probabilidade da ocorrência de cada símbolo
    counts = Counter(seq)
    prob = [counts[i]/N for i in range(M)]
    
    #calculo a entropia 
    H = -sum(p * np.log2(p) for p in prob if p > 0)
    print(f"Entropia da fonte com alfabeto de tamanho {M} e N={N}: {H:.4f}")
    
    # estimar a entropia das sequências
    freq = [counts[i]/N for i in range(M)]
    H_est = -sum(p * np.log2(p) for p in freq if p > 0)
    print(f"Entropia estimada com N={N}: {H_est:.4f}\n")
