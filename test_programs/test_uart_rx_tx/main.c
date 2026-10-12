#include <stdint.h>
#define UART_RX (uint32_t *)0x05000000
#define UART_TX (uint32_t *)0x06000000

volatile char rcv_uart;

void int_handler(void)
{
    uint32_t *uart_rx = UART_RX;
    while (*(uart_rx + 2));
    rcv_uart = *uart_rx;

}

void init_uart_rx()
{
    uint32_t *uart_rx = UART_RX;
    *(uart_rx + 3) = 115200;
    *(uart_rx + 4) = 1;
    *(uart_rx + 5) = 1;

}

void init_uart_tx()
{
    uint32_t *uart_tx = UART_TX;
    *(uart_tx + 3) = 115200;
    *(uart_tx + 4) = 1;
    *(uart_tx + 5) = 1;

}

void uart_send_char(char data)
{
    uint32_t *uart_tx = UART_TX;
    *uart_tx = data;
}


int main() 
{
    uint32_t read_data;
    read_data = *(UART_TX);
    read_data = *(UART_TX + 3);
    read_data = *(UART_TX + 4);
    read_data = *(UART_TX + 5);
    init_uart_tx();
    uart_send_char(0x66);
    
    
    return 0;
}

/* rx, tx tests: send data, receive data, read and write to registers */
// 1 initial read
// 2 initialize
// 3 read from registers
// 4 send and receive data
// 5 soft reset
// 6 read from registers
