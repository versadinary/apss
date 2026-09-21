#include "unit.h"
#include "platform.h"

void byte_test()
{
    init_testing();
    char d_tx;
    char d_rx;
    d_tx = gen_data();
    send_char(d_tx);
    d_rx = rcv_char();
    char result = 0;
    char test = 0;
    test = (d_tx ^ d_rx);
    const char *msg1 = "FAILURE\n";
    const char *msg2 = "SUCCESS\n";
    if (test) {
        for (int i = 0; msg2[i] != '\0'; i++) send_char(msg1[i]);
    }
    else {
        for (int i = 0; msg1[i] != '\0'; i++) send_char(msg2[i]);
    }
}

void init_testing()
{
    char buf;
    buf = rcv_char();
}

char gen_data()
{
    return 0xAB;
}

int main()
{
    config_uart_rx();
    config_uart_tx();
    while (1)
        byte_test();

    return 0;
}
