def twos_complement(num, bits):
    if num >= 0:
        return hex(num)[2:]
    else:
        return hex((1 << bits) + num)[2:]




a, b = int(input("a: ")), int(input("sw: "))
print(twos_complement(a, 23))
print(twos_complement(b, 16))
