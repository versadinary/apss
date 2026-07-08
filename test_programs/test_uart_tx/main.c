#include "platform.h"

volatile uint32_t sc = 0;

void int_handler(void) {

}

void uart_send_char(char c) {
    while(tx_ptr->busy);
    tx_ptr->data = c;
    while(tx_ptr->busy);
}

void uart_init() {
    tx_ptr->baudrate = 115200;
    tx_ptr->parity_bit = 1;
    tx_ptr->stop_bit = 1;
}

int main() { 
    uart_init();
    const char str[] = "hello, world";
    for (int i = 0; i < sizeof(str); i++)
        uart_send_char(str[i]);

    return 0;
}
