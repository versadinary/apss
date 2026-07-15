#include "platform.h"
#define TIMER_INF 2
#define CLOCKS_PER_SEC 100000

volatile uint32_t int_count = 0;

void int_handler() {
    int_count++;
    hex_ptr->hex0 = timer_ptr->system_counter_low_bits;
}

void timer_init() {
    timer_ptr->rst = 1;
    timer_ptr->rst = 0;
    timer_ptr->mode = TIMER_INF;
    timer_ptr->delay_low_bits = CLOCKS_PER_SEC;
}

void print(unsigned digit, unsigned pos) {
    switch (pos) {
        case 0:
            hex_ptr->hex0 = digit;
            break;
        case 1:
            hex_ptr->hex1 = digit;
            break;
        case 2:
            hex_ptr->hex2 = digit;
            break;
        case 3:
            hex_ptr->hex3 = digit;
            break;
        case 4:
            hex_ptr->hex4 = digit;
            break;
        case 5:
            hex_ptr->hex5 = digit;
            break;
        case 6:
            hex_ptr->hex6 = digit;
            break;
        case 7:
            hex_ptr->hex7 = digit;
            break;
    }
}


int main() { 
    timer_init();
    hex_ptr->bitmask = 0xff;
    /*while (1) {
        if (int_count == 0xFFFF) {
            hex_ptr->rst = 1;
            hex_ptr->rst = 0;
            hex_ptr->bitmask = 0xff;
            int_count = 0;
        }*/
    //print(int_count, int_count >> 4);
    print(1, 3);
    print(0xe, 2);
    print(0xa, 1);
    print(0xd, 0);
    print(timer_ptr->delay_low_bits, 5);
    print(timer_ptr->mode, 6);
    print(timer_ptr->system_counter_low_bits, 7);
    while (1);

    return 0;
}
