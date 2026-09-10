#include "platform.h"

#define BAUDRATE 115200
#define PARITY 1
#define STOP 1

char rcv_data;
char data_vld = 0;

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
    data_vld = 1;
}

int main(void)
{
    init_uart_rx(BAUDRATE, PARITY, STOP);
    init_uart_tx(BAUDRATE, PARITY, STOP);
    hex_ptr->bitmask = 0xFF;
    hex_ptr->hex0 = 0;
    hex_ptr->hex1 = 0;
    hex_ptr->hex7 = 0;
    data_vld = 0;
    while (1) {
        if (data_vld) {
            // uart_send_char(&rcv_data);
            hex_ptr->hex0 = rcv_data;
            hex_ptr->hex1 = rcv_data >> 4;
            hex_ptr->hex7 = hex_ptr->hex7 == 8 ? 0 : 8;
            uart_send_char((char *)'a');
            data_vld = 0;
        }
    }

    return 0;
}
