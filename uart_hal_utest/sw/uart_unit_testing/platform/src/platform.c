#include "peripherals_addr.h"
#include "unit.h"
#include "platform.h"

char rcv_data_int;
char data_vld_int;

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

void send_char(virtual_uart *uart_inst, char data_to_send)
{
    while(tx_ptr->busy);
    uart_inst->data_to_send = data_to_send;
    tx_ptr->data = data_to_send;
}

void rcv_char(virtual_uart *uart_inst, char *received_data)
{
    /*
    while (rx_ptr->busy);
    *received_data = rx_ptr->data;
    uart_inst->rcv_data = *received_data;
    uart_inst->data_rcv_valid = 1;
    */
    while (~data_vld_int);
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
