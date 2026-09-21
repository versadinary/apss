#include "peripherals_addr.h"
#include "unit.h"
#include "platform.h"

char rcv_data_int;
volatile char data_vld_int;

void config_uart_rx()
{
    rx_ptr->baudrate = 115200;
    rx_ptr->parity_bit = 1;
    rx_ptr->stop_bit = 1;
}

void config_uart_tx()
{
    tx_ptr->baudrate = 115200;
    tx_ptr->parity_bit = 1;
    tx_ptr->stop_bit = 1;
}

void send_char_bare(char data)
{
    tx_ptr->data = data;
    while (tx_ptr->busy);
}

void send_char(char data_to_send)
{
    tx_ptr->data = data_to_send;
    while (tx_ptr->busy);
}

char rcv_char()
{
    data_vld_int = 0;
    while (data_vld_int ^ 1);
    char received_data;
    received_data = rx_ptr->data;
    data_vld_int = 0;
    return received_data;
}

void rcv_uart_int()
{
    while (rx_ptr->busy);
    data_vld_int = 1;
}

void int_handler()
{
    rcv_uart_int();
}
