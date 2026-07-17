#include "config_platform.h"
#include "snake.h"
#define TIMER_DELAY 200000

extern volatile uint8_t (*video_memory_2d)[WIDTH];
extern volatile uint8_t *video_memory_1d;
extern Snake snake;


void config_periph() {
    video_memory_1d = vga.char_map;
    video_memory_2d = (volatile uint8_t (*)[WIDTH])vga.char_map;
    timer_ptr->mode = 2;
    timer_ptr->delay_low_bits = TIMER_DELAY;
}

bool get_key(uint8_t &key) {
    key = ps2_ptr->scan_code;
    return ps2_ptr->unread_data;
}

size_t get_random_value() {
    return timer_ptr->system_counter_low_bits >> 4;
}



void seed_rng(size_t seed) {

}

///
extern "C" void int_handler() {
    game_cycle();
} 
///
