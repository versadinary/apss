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

data_to_send = rcv_data

ser.write(data_to_send)

response = ser.read(1)

while (response.decode('utf-8') != '\n'):
    response = ser.read(1)
    print("RCV RESP:", response)
