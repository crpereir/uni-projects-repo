
import collections 
from collections import Counter

def most_least_frequency(filename):
    with open ("ListaPalavrasPT.txt") as f: 
        #conta quantas vezes aparece cada caracter
        counter = Counter(f.read()) 
    
        del counter[' ']
        del counter['\n']
    
    #read the content of file and replace spaces with nothing
        data = f.read().replace(" ","")
    #get the length of the data
        number_of_characters = len(data)

    print('character occurance percentage :', (counter//number_of_characters) * 100)
    
    
