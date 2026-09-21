#pragma once

void config_uart_rx();

void config_uart_tx();

void int_handler();

void rcv_uart_int();

void send_char_bare(char data);
