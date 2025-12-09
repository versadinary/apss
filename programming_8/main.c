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

int scan(int* cnt, int* digit) {
    sc = 0;
    while (!sc) {
        if (sc == 0x5a) return 1;
        if (sc == 0x76) return 2;
        *digit = sc;
        hex_ptr->bitmask <<= 1;
        hex_ptr->bitmask += 1;
    }
    while (sc != 0xf0);
    while (sc == 0xf0);

    return 0;
}

int main() {
    unsigned a = 0, b = 0;
      

    return 0;
}
