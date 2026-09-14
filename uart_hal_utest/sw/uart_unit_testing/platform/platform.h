void config_uart_rx();

void config_uart_tx();


void send_char(virtual_uart *uart_inst, char data_to_send);

void rcv_char(virtual_uart *uart_inst, char *received_data);
