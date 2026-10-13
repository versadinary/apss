#include <stdint.h>
#define UART_RX (uint32_t *)0x05000000
#define UART_TX (uint32_t *)0x06000000

volatile char rcv_uart;
volatile uint32_t read_data;

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

void full_read_tx()
{
    read_data = *(UART_TX);
    for (int i = 0; i < 3; i++)
        uart_send_char((char)(read_data >> (i << 2)));
    read_data = *(UART_TX + 3);
    for (int i = 0; i < 3; i++)
        uart_send_char((char)(read_data >> (i << 2)));
    read_data = *(UART_TX + 4);
    for (int i = 0; i < 3; i++)
        uart_send_char((char)(read_data >> (i << 2)));
    read_data = *(UART_TX + 5);
    for (int i = 0; i < 3; i++)
        uart_send_char((char)(read_data >> (i << 2)));
}

void full_read_rx()
{
    read_data = *(UART_RX);
    for (int i = 0; i < 3; i++)
        uart_send_char((char)(read_data >> (i << 2)));
    read_data = *(UART_RX + 3);
    for (int i = 0; i < 3; i++)
        uart_send_char((char)(read_data >> (i << 2)));
    read_data = *(UART_RX + 4);
    for (int i = 0; i < 3; i++)
        uart_send_char((char)(read_data >> (i << 2)));
    read_data = *(UART_RX + 5);
    for (int i = 0; i < 3; i++)
        uart_send_char((char)(read_data >> (i << 2)));
}


int main() 
{
    full_read_tx();
    full_read_rx();
    init_uart_tx();
    init_uart_rx();
    full_read_tx();
    full_read_rx();
    
    return 0;
}

/* rx, tx tests: send data, receive data, read and write to registers */
// 1 initial read
// 2 initialize
// 3 read from registers
// 4 send and receive data
// 5 soft reset
// 6 read from registers
