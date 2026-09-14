#pragma once

typedef struct {
    char data_to_send;
    char rcv_data;
    char data_rcv_valid;

} virtual_uart;

extern void send_char(virtual_uart *uart_inst, char data_to_send);

extern void rcv_char(virtual_uart *uart_inst, char *received_data);
