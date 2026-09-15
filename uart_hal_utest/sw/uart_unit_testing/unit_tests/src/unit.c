#include "unit.h"

virtual_uart UART1;

TEST_STATUS byte_test()
{
    init_testing(&UART1);
    char d_tx, d_rx;
    d_tx = gen_data();
    send_char(&UART1, d_tx);
    rcv_char(&UART1, &d_rx);
    TEST_STATUS s;
    s = cmp_snd_rcv(&UART1);

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
    s = (uart->data_to_send ^ uart->rcv_data) ? FAIL : SUCCESS;
    return s;
}
void send_response(TEST_STATUS byte_status)
{
    const char *msg = byte_status ? "SUCCESS\n" : "FAILURE\n";
    for (int i = 0; msg[i] != '\0'; i++) send_char(&UART1, msg[i]);
}

int main()
{
    byte_test();

    return 0;
}
