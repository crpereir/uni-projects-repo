import random

def gerar_palavra_passe():
    array = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%&*'
    tamanho = random.randint(8, 12)
    palavra_passe = ''.join(random.choices(array, k=tamanho))
    return palavra_passe


for i in range(5):
    print(gerar_palavra_passe())
