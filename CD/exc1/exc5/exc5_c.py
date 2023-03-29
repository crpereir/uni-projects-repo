

import collections 
from collections import Counter

def most_least_frequency(filename):
    with open (filename) as f:
        counter = Counter(f.read())

    del counter[' ']
    del counter['\n']

    print("The least frequent character is", str(min(counter, key = counter.get)))
    print("The most frequent character is", str(max(counter, key = counter.get)))


most_least_frequency("a.txt")
most_least_frequency("alice29.txt")

