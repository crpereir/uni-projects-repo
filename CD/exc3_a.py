import random

def gerar_simbolos(arquivo, fmp, n):
    """
    Gera um arquivo com N símbolos de acordo com a FMP do alfabeto de M símbolos.
    :param arquivo: nome do arquivo a ser gerado.
    :param fmp: lista contendo a FMP do alfabeto de símbolos.
    :param n: número de símbolos a serem gerados.
    :return: lista de símbolos gerados.
    """
    alfabeto = list(range(len(fmp)))  # cria uma lista com os símbolos do alfabeto
    simbolos = []
    with open(arquivo, 'w') as f:
        for i in range(n):
            simbolo = random.choices(alfabeto, weights=fmp)[0]  # escolhe um símbolo de acordo com a FMP
            f.write(str(simbolo) + '\n')  # escreve o símbolo no arquivo
            simbolos.append(simbolo)
    return simbolos

# exemplo de uso
fmp = [0.1, 0.2, 0.3, 0.4]  # FMP do alfabeto de símbolos
n = 1000  # número de símbolos a serem gerados
arquivo = 'simbolos.txt'  # nome do arquivo a ser gerado
simbolos = gerar_simbolos(arquivo, fmp, n)  # gera os símbolos e o arquivo
print(simbolos)
