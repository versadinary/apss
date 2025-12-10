#include "platform.h"

volatile uint32_t sc = 0;

void int_handler(void) {
    sc = ps2_ptr->scan_code;      
}

int scan(unsigned* digit) {
    sc = 0;
    while (!sc);
    while (sc != 0xf0);
    while (sc == 0xf0);
    if (sc == 0x5a) return 1;
    if (sc == 0x76) return 2;
    if (sc == 0x45) *digit = 0;
    if (sc == 0x16) *digit = 1;
    if (sc == 0x1e) *digit = 2;
    if (sc == 0x26) *digit = 3;
    if (sc == 0x25) *digit = 4;
    if (sc == 0x2e) *digit = 5;
    if (sc == 0x36) *digit = 6;
    if (sc == 0x3d) *digit = 7;
    if (sc == 0x3e) *digit = 8;
    if (sc == 0x46) *digit = 9;
    if (sc == 0x1c) *digit = 10; 
    if (sc == 0x32) *digit = 11;
    if (sc == 0x21) *digit = 12;
    if (sc == 0x23) *digit = 13;
    if (sc == 0x24) *digit = 14; 
    if (sc == 0x2b) *digit = 15;

    return 0;
}

void print(unsigned* digit, unsigned pos) {
    if (pos == 0) hex_ptr->hex0 = *digit; 
    if (pos == 1) hex_ptr->hex1 = *digit; 
    if (pos == 2) hex_ptr->hex2 = *digit; 
    if (pos == 3) hex_ptr->hex3 = *digit; 
    if (pos == 4) hex_ptr->hex4 = *digit; 
    if (pos == 5) hex_ptr->hex5 = *digit; 
    if (pos == 6) hex_ptr->hex6 = *digit; 
    if (pos == 7) hex_ptr->hex7 = *digit; 
    hex_ptr->bitmask <<= 1;
    hex_ptr->bitmask += 1;
}

int main() { 
    unsigned d = 0;
    int pos = 0;
    int a = 0;
    int b = 0;
    while (scan(&d) < 1 && pos < 8) {
        print(&d, pos);
        pos += 1;
        a += d;
        a <<= 4;
    }
    a >>= 4;
    hex_ptr->rst = 1;
    hex_ptr->rst = 0;
    pos = 0;
    d = 0;
    while (scan(&d) < 1 && pos < 8) {
        print(&d, pos);
        pos += 1;
        b += d;
        b <<= 4;
    }
    b >>= 4;
    unsigned res = 0;
    hex_ptr->rst = 1;
    hex_ptr->rst = 0;
    while (b > 0) {
        if (b & 1) res += a;
        a <<= 1;
        b >>= 1;
    }
    hex_ptr->bitmask = 0xff;
    hex_ptr->hex0 = res;
    res >>= 4;
    hex_ptr->hex1 = res;
    res >>= 4;
    hex_ptr->hex2 = res;
    res >>= 4;
    hex_ptr->hex3 = res;
    res >>= 4;
    hex_ptr->hex4 = res;
    res >>= 4;
    hex_ptr->hex5 = res;
    res >>= 4;
    hex_ptr->hex6 = res;
    res >>= 4;
    hex_ptr->hex7 = res;


    return 0;
}
