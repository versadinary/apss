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
            vga.char_map[pos] = ' '; 
            pos -= COLS;
            vga.char_map[pos] = 'X'; 
            vga.color_map[pos] = 0xf0;
            break;
        case 0x1C:
            vga.char_map[pos] = ' '; 
            pos -= 1;
            vga.char_map[pos] = 'X'; 
            vga.color_map[pos] = 0xf0;
            break;
        case 0x1B:
            vga.char_map[pos] = ' '; 
            pos += COLS;
            vga.char_map[pos] = 'X'; 
            vga.color_map[pos] = 0xf0;
            break;
        case 0x23:
            vga.char_map[pos] = ' '; 
            pos += 1;
            vga.char_map[pos] = 'X'; 
            vga.color_map[pos] = 0xf0;
            break;
        case 0x5A:
            vga.color_map[pos] = 0xff;
            break;
        case 0x76:
            vga.color_map[pos] = 0x00;
            break;

        }

}

void clear_canvas() {
    for (int i = 0; i < ROWS; i++) {
        for (int k = 0; k < COLS; k++) {
            vga.char_map[i * COLS + k] = ' ';
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
