
def freq_symbols(filename):
    freq = {}
    with open(filename, 'r') as file:
        for line in file:
            for char in line:
                if char in freq:
                    freq[char] += 1
                else:
                    freq[char] = 1
    most_common = max(freq, key=freq.get)
    least_common = min(freq, key=freq.get)
    return most_common, freq[most_common], least_common, freq[least_common]