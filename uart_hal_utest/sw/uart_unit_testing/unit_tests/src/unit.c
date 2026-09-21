#include "unit.h"
#include "platform.h"

TEST_STATUS byte_test(virtual_uart *uart)
{
    init_testing(uart);
    char d_tx, d_rx;
    d_tx = gen_data();
    send_char(uart, d_tx);
    rcv_char(uart, &d_rx);
    TEST_STATUS s;
    s = cmp_snd_rcv(uart);
    send_response(s, uart);
}

void init_testing(virtual_uart *uart)
{
    char *buf;
    rcv_char(uart, buf);
}

char gen_data()
{
    return 0xAB;
}

TEST_STATUS cmp_snd_rcv(virtual_uart *uart)
{
    TEST_STATUS s;
    char test = ~((uart->data_to_send) ^ (uart->rcv_data));
    s = 0xFF - test ? FAIL : SUCCESS;
    return s;
}

void send_response(TEST_STATUS byte_status, virtual_uart *uart)
{
    const char *msg = byte_status ? "SUCCESS\n" : "FAILURE\n";
    for (int i = 0; msg[i] != '\0'; i++) send_char(uart, msg[i]);
}

int main()
{
    virtual_uart UART1;
    config_uart_rx();
    config_uart_tx();
    byte_test(&UART1);

    return 0;
}
