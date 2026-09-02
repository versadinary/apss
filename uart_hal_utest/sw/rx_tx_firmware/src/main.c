#include "platform.h"

#define BAUDRATE 115200
#define PARITY 1
#define STOP 1

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

int main(void)
{
    init_uart_rx(BAUDRATE, PARITY, STOP);
    init_uart_tx(BAUDRATE, PARITY, STOP);
    while (1) {
        if (data_flag) {
            uart_send_char(&rcv_data);
            data_flag = 0;
        }
    }

    return 0;
}
