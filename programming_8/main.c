#include "platform.h"

volatile int sc = 0;

void int_handler(void) {
    sc = ps2_ptr->scan_code;      
}

unsigned ps2_to_int(unsigned ps2) {
    unsigned codes[] = {0x45, 0x16, 0x1e, 
                        0x26, 0x25, 0x2e,
                        0x36, 0x3d, 0x3e,
                        0x46, 0x1c, 0x32,
                        0x21, 0x23, 0x24, 0x26};

    unsigned vals[] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9,
                        0xa, 0xb, 0xc, 0xd, 0xe, 0xf};

    int i = 0;
    for (; i < sizeof(codes) / sizeof(*codes) && ps2 != codes[i]; i++);

    return vals[i];

}

int scan(unsigned* digit) {
    sc = 0;
    while (!sc) {
        if (sc == 0x5a) return 1;
        if (sc == 0x76) return 2;
        *digit = ps2_to_int(sc);
    }
    while (sc != 0xf0);
    while (sc == 0xf0);

    return 0;
}

void print(unsigned* digit, unsigned pos) {
    *(&hex_ptr->hex0 + pos) = *digit;
    hex_ptr->bitmask += 1;
    hex_ptr->bitmask <<= 1;
}

int main() {
    unsigned d = 0;
    int pos = 0;
    while (scan(&d) < 1) {
        print(&d, pos++);
    }

    return 0;
}
