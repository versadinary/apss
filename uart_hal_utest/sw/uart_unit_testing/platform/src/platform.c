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
    while (tx_ptr->busy);
    tx_ptr->data = data;
    while (tx_ptr->busy);
}

void send_char(virtual_uart *uart_inst, char data_to_send)
{
    while (tx_ptr->busy);
    uart_inst->data_to_send = data_to_send;
    tx_ptr->data = data_to_send;
    while (tx_ptr->busy);
}

void rcv_char(virtual_uart *uart_inst, char *received_data)
{
    char flag;
    data_vld_int = 0;
    while (data_vld_int ^ 1);
    data_vld_int = 0;
    uart_inst->rcv_data = rcv_data_int;
    uart_inst->data_rcv_valid = 1;
}

void rcv_uart_int()
{
    while (rx_ptr->busy);
    rcv_data_int = rx_ptr->data;
    data_vld_int = 1;
}

void int_handler()
{
    rcv_uart_int();
}
