import random

def password(alfabeto, length):
    passw = ''
    for i in range(length):
        symb = random.choice(lista)  # escolhe um símbolo aleatório do alfabeto
        passw += symb
    return passw

# alfabeto contendo letras maiúsculas, minúsculas, dígitos e caracteres especiais
lista = list('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!?')

# gera cinco senhas aleatórias de tamanho entre 8 e 12 caracteres
for i in range(5):
    length = random.randint(8, 12)  # escolhe um tamanho aleatório entre 8 e 12
    senha = password(lista, length)  # gera a senha
    print(senha)
