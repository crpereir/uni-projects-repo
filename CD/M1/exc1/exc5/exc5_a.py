def geometric_progression(N, u, r):
    for n in range(1, N + 1):
        gp = u * r ** (n - 1)
    return gp

def main():
    print("GEOMETRIC PROGRESSION")
    N = input("Choose N: ")
    u = input("Choose u: ")
    r = input("Choose r: ")
    result = geometric_progression(N, u, r)
    print("Result = " + str(result))

main()