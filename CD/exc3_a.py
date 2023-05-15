import random

def gerar_simbolos(ficheiro, fmp, n):
    num = list(range(len(fmp))) 
    simbolos = []
    with open(ficheiro, 'w') as f:
        for i in range(n):
            simbolo = random.choices(num, weights=fmp)[0]  
            f.write(str(simbolo) + '\n') 
            simbolos.append(simbolo)
    return simbolos


fmp = [0.1, 0.2, 0.3, 0.4]  
n = 1000  
ficheiro = 'simbolos.txt'  
simbolos = gerar_simbolos(ficheiro, fmp, n)  

