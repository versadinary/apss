#include "platform.h"
#define ROWS 30
#define COLS 80
#define TIMER_DELAY 200000

volatile uint32_t ps2_scan = 0;
volatile int pos = 0;

void int_handler() {
    ps2_scan = ps2_ptr->unread_data ? ps2_ptr->scan_code : 0;
    switch (ps2_scan) {
        case 0x1D:
            pos -= COLS;
            break;
        case 0x1C:
            pos -= 1;
            break;
        case 0x1B:
            pos += COLS;
            break;
        case 0x23:
            pos += 1;
            break;
        }
    vga.color_map[pos] = 0xff;
    vga.color_map[pos] = 0xcc;

}

void clear_canvas() {
    for (int i = 0; i < ROWS; i++) {
        for (int k = 0; k < COLS; k++) {
            vga.char_map[i * COLS + k] = 0;
            vga.color_map[i * COLS + k] = 0;
        }
    }
    vga.color_map[0] = 0xff;
}

void init_devices() {
    clear_canvas();
    timer_ptr->mode = 2;
    timer_ptr->delay_low_bits = TIMER_DELAY;

}

int main() { 
    init_devices();
    pos = 0;

    return 0;
}
