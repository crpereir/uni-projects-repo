import math


with open('ListaPalavrasPT.txt', 'r') as file: 
    content = file.read() #lê o ficheiro e guarda em content
    total_chars = len(content) #calculo o n total de chars 
    char_count = {} #crio um dicionário vazio
    for char in content:
        #para cada caracter incremento um no n de ocorrencias
        char_count[char] = char_count.get(char, 0) + 1

    for char, count in char_count.items():
        #calculo a percentagem 
        percent = (count / total_chars) * 100
        print(f'{char}: {percent:.2f}%')

    #faço a entropia
    entropy = 0
    for count in char_count.values():
        probability = count / total_chars
        entropy -= probability * math.log2(probability)

    print(f'Entropia para a língua portuguesa: {entropy:.2f}')