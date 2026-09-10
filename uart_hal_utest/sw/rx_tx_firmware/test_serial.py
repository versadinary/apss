import serial
import sys
import time

com = sys.argv[1]

ser = serial.Serial(
    port=com,
    baudrate=115200,
    parity=serial.PARITY_EVEN,
    stopbits=serial.STOPBITS_ONE,
    bytesize=serial.EIGHTBITS,
    timeout=10
)

print("UART RX TX TEST");
while (1):
    in_char = ord(input('input:'))
    ser.write(bytes(in_char))
    # ser.write('\x57')   
    rcv_char = ser.read(1)
    print(rcv_char)
