#pragma once

typedef struct {
    char data_to_send;
    char rcv_data;
    char data_rcv_valid;

} virtual_uart;

enum { FAIL = 0, SUCCESS = 1 } TEST_STATUS;

extern void send_char(virtual_uart *uart_inst, char data_to_send);

extern void rcv_char(virtual_uart *uart_inst, char *received_data);

void init_testing(virtual_uart *uart_inst);

char gen_data();

TEST_STATUS cmp_snd_rcv(virtual_uart *uart);

TEST_STATUS byte_test();
