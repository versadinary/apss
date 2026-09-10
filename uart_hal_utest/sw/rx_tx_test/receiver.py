import serial
import sys

com = sys.argv[1]


ser = serial.Serial(
    port=com,
    baudrate=115200,
    parity=serial.PARITY_EVEN,
    stopbits=serial.STOPBITS_ONE,
    bytesize=serial.EIGHTBITS,
    timeout=10
)

ser.write(0x01);

rcv_data = ser.read(1)
print('RCV DATA:', rcv_data)

ser.write(rcv_data)

for i in range(5):
    response = ser.read(1)
    print("RCV RESP:", response, i)
