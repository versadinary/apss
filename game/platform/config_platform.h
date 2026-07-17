#include "platform.h"
#include <cstdint>
#include <cstddef>


void config_periph();

bool get_key(uint8_t &key);

size_t get_random_value();

void seed_rng(size_t seed);

extern void game_cycle();

extern "C" void int_handler();

///

//==============================================================================
