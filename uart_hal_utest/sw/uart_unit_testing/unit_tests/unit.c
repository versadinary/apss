#include "unit.h"

virtual_uart UART1;

TEST_STATUS byte_test()
{
    init_testing(&UART1);
    char d_tx, d_rx;
    d = gen_data();
    send_char(&UART1, d);
    rcv_char(&d_rx);
    TEST_STATUS s;
    s = cmp_snd_rcv(&UART1);

}

void init_testing(virtual_uart *uart)
{
    while (~uart->data_rcv_valid);
    uart->data_rcv_valid = 0;
}

char gen_data()
{
    return 0xff; // TODO 
}
