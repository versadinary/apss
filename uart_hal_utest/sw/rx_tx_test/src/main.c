#include "platform.h"

#define BAUDRATE 115200
#define PARITY 1
#define STOP 1

enum { FAIL = 0, SUCCESS = 1} STATUS;

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
    while (rx_ptr->busy);
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
    int N = 3;
    init_uart_rx(BAUDRATE, PARITY, STOP);
    init_uart_tx(BAUDRATE, PARITY, STOP);
    char data_to_send[N] = {0x10, 0x20, 0x30};
    STATUS test_statuses[N];
    
    for (int i = 0; i < N; i++) {
        test_statuses[i] = one_byte_test(&data_to_send[i]);
    }


    return 0;
}
