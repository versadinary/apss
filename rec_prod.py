def product(a, b):
    res = 0
    one = 1
    if (b == 0): return res
    check = b & one
    if (check): res += a
    return res + product(a << one, b >> one)

print(product(*map(int, input().split())))
