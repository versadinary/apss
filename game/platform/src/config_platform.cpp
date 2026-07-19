#include "config_platform.h"
#include "platform.h"

void config_periph()
{
    video_memory_1d = vga.char_map;
    video_memory_2d = (volatile uint8_t (*)[WIDTH])vga.char_map;
    timer_ptr->mode = 2;
    timer_ptr->delay_low_bits = TIMER_DELAY;
}

bool get_key(uint8_t &key)
{
    bool has_unread_data = ps2_ptr->unread_data;
    key = ps2_ptr->scan_code;

    return has_unread_data;
}

size_t get_random_value()
{
    size_t rng = rand();

    return rng;
}

void seed_rng(size_t seed)
{
    srand(timer_ptr->system_counter_low_bits);
}

extern "C" void int_handler()
{
    game_cycle();
} 

