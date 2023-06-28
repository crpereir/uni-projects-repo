def fletcher_checksum(data):
    sum1 = 0
    sum2 = 0

    for value in data:
        sum1 = (sum1 + value) % 255
        sum2 = (sum2 + sum1) % 255

    checksum = (sum2 << 8) | sum1

    return checksum


def detect_error(data, error_index):
    expected_checksum = fletcher_checksum(data)  # Checksum esperado da sequência completa
    print("Expected checksum = ", expected_checksum)
    received_data = list(data)  # Faz uma cópia da sequência de dados
    received_data[error_index] += 1  # Introduz um erro na posição desejada
    received_checksum = fletcher_checksum(received_data)  # Checksum calculado para a sequência com erro
    print("Received checksum = ", received_checksum)

    error_detected = expected_checksum ^ received_checksum  # Realiza operação XOR

    if error_detected != 0:
        print(f"Erro detectado na posição {error_index}.")
    else:
        print(f"Bit {error_index} sem erro.")


# Ler dados do arquivo gerado pelo Arduino
data_file = open("progressao_geometrica.txt", "r")
data = [int(line) for line in data_file]
data_file.close()

# Testar detecção de erro em um bit específico
error_index = 2
detect_error(data, error_index)
