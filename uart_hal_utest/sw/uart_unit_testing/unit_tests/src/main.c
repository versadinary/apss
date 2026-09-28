#include "main.h"

int main()
{
    config_uart_rx();
    config_uart_tx();
    while (1)
        byte_test();

    return 0;
}
