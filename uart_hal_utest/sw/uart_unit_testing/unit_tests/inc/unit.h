#pragma once

typedef enum { FAIL = 0, SUCCESS = 1 } TEST_STATUS;

extern void send_char(char data_to_send);

extern char rcv_char();

void init_testing();

char gen_data();

TEST_STATUS cmp_snd_rcv();

void byte_test();

void send_response(char byte_status);
