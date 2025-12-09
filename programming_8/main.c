#include "platform.h"

volatile uint32_t sc = 0;

void int_handler(void) {
    sc = ps2_ptr->scan_code;      
}

unsigned ps2_to_int(unsigned ps2) {
    switch (ps2) {
        case 0x45: return 0;
        case 0x16: return 1;
        case 0x1e: return 2;
        case 0x26: return 3;
        case 0x25: return 4;
        case 0x2e: return 5;
        case 0x36: return 6;
        case 0x3d: return 7;
        case 0x3e: return 8;
        case 0x46: return 9;
        case 0x1c: return 10; 
        case 0x32: return 11;
        case 0x21: return 12;
        case 0x23: return 13;
        case 0x24: return 14; 
        case 0x15: return 15;
    }

    return 0;
}

int scan(unsigned* digit) {
    sc = 0;
    while (!sc);
    while (sc != 0xf0);
    while (sc == 0xf0);
    if (sc == 0x5a) return 1;
    if (sc == 0x76) return 2;
    *digit = ps2_to_int(sc);

    return 0;
}

void print(unsigned* digit, unsigned pos) {
    *(&hex_ptr->hex0 + pos) = *digit;
    hex_ptr->bitmask <<= 1;
    hex_ptr->bitmask += 1;
}

int main() {
    unsigned d = 0;
    int pos = 0;
    while (scan(&d) < 1) {
        print(&d, pos++);
    }

    return 0;
}
