def first_operand(num):
    return hex(((num < 0) << 23) + num * 2)[2::]

def second_operand(num):
    return hex(((num < 0) << 16) + num)[2::]

a, sw = int(input("a: ")), int(input("sw: "))
print("a:", first_operand(a))
print("sw:", second_operand(sw))
