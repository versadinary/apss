#include "platform.h"

#define BAUDRATE 115200
#define PARITY 1
#define STOP 1

typedef enum { FAIL = 0, SUCCESS = 1 } STATUS;

char rcv_data;
char data_flag = 0;

void init_uart_rx(int baudrate, int parity_bit, int stop_bit)
{
    rx_ptr->baudrate = baudrate;
    rx_ptr->parity_bit = parity_bit;
    rx_ptr->stop_bit = stop_bit;
}

void init_uart_tx(int baudrate, int parity_bit, int stop_bit)
{
    tx_ptr->baudrate = baudrate;
    tx_ptr->parity_bit = parity_bit;
    tx_ptr->stop_bit = stop_bit;
}

char uart_rcv_char(char *rcv)
{
    while (rx_ptr->busy);
    *rcv = rx_ptr->data;
}

void uart_send_char(const char *c)
{
    while (tx_ptr->busy);
    tx_ptr->data = *c;
    while (tx_ptr->busy);
}

void int_handler()
{
    uart_rcv_char(&rcv_data);
    data_flag = 1;
}

STATUS one_byte_test(const char *data)
{
    STATUS test_status;
    uart_send_char(data);
    while (~data_flag);
    data_flag = 0;
    test_status = *data == rcv_data ? SUCCESS : FAIL;
}

int main(void)
{
    init_uart_rx(BAUDRATE, PARITY, STOP);
    init_uart_tx(BAUDRATE, PARITY, STOP);

    char data_to_send = 0x50;
    char test;

    uart_send_char(&data_to_send);
    while (~data_flag) {
        test = (data_to_send ^ rcv_data) == 0xFF;
        const char *msg = test ? "SUCCESS\n" : "FAIL\n";
        for (int i = 0; i < sizeof(msg) + 1; i++) uart_send_char(&msg[i]);
        data_flag = 0;
    }

    return 0;
}
