#include "platform.h"

#define BAUDRATE 115200
#define PARITY 1
#define STOP 1

char rcv_data;
char data_unread = 0;

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

char uart_rcv_char()
{
    while (rx_ptr->busy);
    char read_data = rx_ptr->data;
    data_unread = 1;
    return read_data;
}

void uart_send_char(char c)
{
    while (tx_ptr->busy);
    tx_ptr->data = c;
    while (tx_ptr->busy);
}

void int_handler()
{
    rcv_data = uart_rcv_char();
}

int main(void)
{
    init_uart_rx(BAUDRATE, PARITY, STOP);
    init_uart_tx(BAUDRATE, PARITY, STOP);
    while (1) {
	if (data_unread) {
	    uart_send_char(rcv_data);
	    data_unread = 0;
	}
    }

    return 0;
}
