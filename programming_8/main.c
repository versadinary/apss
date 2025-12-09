#include "platform.h"

volatile int sc = 0;

void int_handler(void) {
    sc = ps2_ptr->scan_code;      
}

unsigned ps2_to_int(unsigned ps2) {
    switch (ps2) {
        case 0x16: return 1;
        case 0x16: return 1;
        case 0x16: return 1;
        case 0x16: return 1;
        case 0x16: return 1;
        case 0x16: return 1;
        case 0x16: return 1;
        case 0x16: return 1;
        case 0x16: return 1;
        case 0x16: return 1;
        case 0x16: return 1;
        case 0x16: return 1;
        case 0x16: return 1;
        case 0x16: return 1;
        case 0x16: return 1;
        case 0x16: return 1;
    }
}

int scan(int* cnt, int* digit) {
    sc = 0;
    while (!sc) {
        if (sc == 0x5a) return 1;
        *digit = sc;
        hex_ptr->bitmask <<= 1;
        hex_ptr->bitmask += 1;
    }
    while (sc != 0xf0);
    while (sc == 0xf0);
}

int main() {
    unsigned a = 0, b = 0;
      

    return 0;
}
