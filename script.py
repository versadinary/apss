def first_operand(num):
    return hex((num < 0 << 23) + num * 2)[2::]

def second_operand(num):
    return hex((num < 0 ? << 16) + num)[2::]

a, b = int(input("a: ")), int(input("sw: "))
print(first_operand(a))
