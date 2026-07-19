#include "snake.h"
#include <cstdint>
#include <cstddef>
#include <stdlib.h>
#define TIMER_DELAY 200000

extern volatile uint8_t (*video_memory_2d)[WIDTH];
extern volatile uint8_t *video_memory_1d;

void config_periph();

bool get_key(uint8_t &key);

size_t get_random_value();

void seed_rng(size_t seed);

extern "C" void int_handler();
