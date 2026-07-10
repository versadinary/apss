#include "platform.h"

void int_handler() {
    
}

int main() { 
    hex_ptr->rst = 1;
    hex_ptr->rst = 0;
    hex_ptr->bitmask = 0xff;
    uint32_t *my_hex_ptr = (uint32_t *)0x04000000;
    for (int i = 0; i < 8; i++)
        *(my_hex_ptr + i) = i;
    

    return 0;
}
