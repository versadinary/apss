#include "platform.h"

#define BAUDRATE 115200
#define PARITY 1
#define STOP 1

char rcv_data;
char data_vld;

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
    data_vld = 1;
}

int main(void)
{
    init_uart_rx(BAUDRATE, PARITY, STOP);
    init_uart_tx(BAUDRATE, PARITY, STOP);
    hex_ptr->bitmask = 0xff;
    hex_ptr->hex7 = 0;
    char send_data = 0x55;
    data_vld = 0;
    while (1) {
        if (data_vld) {
            hex_ptr->hex7 = 1;
            data_vld = 0;
            break;
        }
    }
    uart_send_char(&send_data);
    while (1) {
        if (data_vld) {
            char test = ~(rcv_data ^ send_data);
            const char *status = 0xFF - test ? "FAIL\n" : "SUCCESS\n";
            for (int i = 0; status[i] != '\0'; i++) uart_send_char(&status[i]);
            data_vld = 0;
        }
    }

    return 0;
}
