import random
import math

alphabet = ['A', 'B', 'C', 'D' ]

def generate_sequence(n):
    return ''.join(random.choices(alphabet, k=n))

def estimate_entropy(sequence):
    counts = {}
    for symbol in sequence:
        counts[symbol] = counts.get(symbol, 0) + 1
    probs = [count / len(sequence) for count in counts.values()]
    entropy = -sum(p * math.log2(p) for p in probs)
    return entropy

N = 1000
seq = generate_sequence(N)

estimated_entropy = estimate_entropy(seq)

alphabet_size = len(alphabet)
theoretical_entropy = math.log2(alphabet_size)

print(f"Sequence length: {N}")
print(f"Estimated entropy: {estimated_entropy:.3f}")
print(f"Source entropy: {theoretical_entropy:.3f}")
