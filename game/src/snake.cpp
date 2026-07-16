/* -----------------------------------------------------------------------------
* Project Name   : Architectures of Processor Systems (APS) lab work
* Organization   : National Research University of Electronic Technology (MIET)
* Department     : Institute of Microdevices and Control Systems
* Author(s)      : Andrei Solodovnikov
* Email(s)       : hepoh@org.miet.ru

See https://github.com/MPSU/CYBERsnake/blob/master/LICENSE file for licensing
details.
* ------------------------------------------------------------------------------
*/
#include "snake.h"

enum game_state
{
  // We use values that can be used directly in computing new position
  ACTIVE,
  PAUSED,
  IDLE
};

game_state state = IDLE;
volatile uint8_t (*video_memory_2d)[WIDTH];
volatile uint8_t *video_memory_1d;

Snake snake;
size_t snack_coord  = 0;

int main()
{
  config_periph();
  clear_screen();

  while(true)
  {
    do_new_game();
    while (state != ACTIVE);
    prepare_game();
    while (state != IDLE);
  }
  return 0;
}

void clear_screen()
{
  for (size_t i = 0; i < WIDTH * HEIGHT; i++)
  {
    video_memory_1d[i] = ' ';
  }
}

void print_string(size_t row, size_t column, const char *str, size_t size)
{
  for (size_t i = 0; i < size; i++)
  {
    video_memory_2d[row][column + i] = str[i];
  }
}

void print_uint32(size_t row, size_t column, uint32_t number)
{
  video_memory_2d[row][column    ] = '0';
  video_memory_2d[row][column + 1] = 'x';
  uint8_t cur_digit;
  uint8_t cur_nibble;

  for (size_t i = 0; i < 8; i++)
  {
    cur_nibble = (number >> (i * 4)) & 0xF;
    cur_digit = cur_nibble < 10 ? cur_nibble + '0' : cur_nibble + 'a' - 0xa;
    // start_coord + 2 (because of 0x) + 7 - i (to place MSB first)
    video_memory_2d[row][column + 9 - i] = cur_digit;
  }
}

template <size_t N>
size_t print_string_at_center(size_t row, const char (&str)[N])
{
  static constexpr size_t len = N-1;
  static_assert(len <= static_cast<size_t>(WIDTH),
                "String greater than current WIDTH");
  static constexpr size_t col = (WIDTH - len) / 2;
  print_string(row, col, str, len);
  return col + len;
}

void do_new_game()
{
  state = IDLE;
  snake.reset();
  print_string_at_center(HEIGHT / 2, "Press any key to start new game");
}

void prepare_game()
{
  seed_rng();
  clear_screen();
  place_walls();
  place_snack();
  snake.reset();
}

void do_game_over()
{
  state = IDLE;
  size_t col = print_string_at_center(HEIGHT/2-1, "Game over. Your score is: ");
  print_uint32(HEIGHT/2-1, col, snake.size() - (START_TAIL_WIDTH + 1));
  return;
}

void do_game_finish()
{
  state = IDLE;
  size_t col = print_string_at_center(HEIGHT/2-1, "You won. Your score is: ");
  print_uint32(HEIGHT/2 - 1, col, snake.size() - (START_TAIL_WIDTH + 1));
}

const char pause_str1[] = "Game paused";
const char pause_str2[] = "Press Enter to continue";
constexpr size_t pause_len1 = std::size(pause_str1);
constexpr size_t pause_len2 = std::size(pause_str2);
char backup_array1[pause_len1];
char backup_array2[pause_len2];

void do_game_pause()
{
  for (size_t i = 0; i < pause_len1; i++)
  {
    backup_array1[i] = video_memory_2d[HEIGHT / 2 - 1][WIDTH / 2 - pause_len1 / 2 + i];
  }
  for (size_t i = 0; i < pause_len2; i++)
  {
    backup_array2[i] =
        video_memory_2d[HEIGHT / 2][WIDTH / 2 - pause_len2 / 2 + i];
  }
  print_string_at_center(HEIGHT / 2 - 1, pause_str1);
  print_string_at_center(HEIGHT / 2, pause_str2);
  state = PAUSED;
}

void do_game_unpause()
{
  for (size_t i = 0; i < pause_len1; i++)
  {
    video_memory_2d[HEIGHT/2-1][WIDTH/2 - pause_len1/2 + i] = backup_array1[i];
  }
  for (size_t i = 0; i < pause_len2; i++)
  {
    video_memory_2d[HEIGHT/2][WIDTH/2 - pause_len2/2 + i] = backup_array2[i];
  }
  state = ACTIVE;
}

void game_cycle()
{
  snake.get_input();
  if (state == ACTIVE)
  {
    snake.move_head();
    if (snake.is_eating(snack_coord))
    {
      if(snake.size() == WIN_LENGTH)
      {
        do_game_finish();
      }
      else
      {
        place_snack();
      }
    }
    else
    {
      snake.move_tail();
      if (snake.has_head_accident())
      {
        do_game_over();
      }
    }
  }
}

void place_walls()
{

  for(size_t i = 0; i < WIDTH; i++)
  {
    video_memory_2d[         0][i] = WALL_CHAR;
    video_memory_2d[HEIGHT - 1][i] = WALL_CHAR;
  }
  for (size_t i = 1; i < HEIGHT - 1; i++)
  {
    video_memory_2d[i][        0] = WALL_CHAR;
    video_memory_2d[i][WIDTH - 1] = WALL_CHAR;
  }
}

void place_snack()
{
  size_t try_count = 0;
  do
  {
    if (try_count > SNACK_ATTEMPTS_LIMIT)
    {
      size_t column = print_string_at_center(0,
                      "Stuck at generating snack. It's coord is: ");
      print_uint32(0, column, snack_coord);
    }
    // Mask is applied to align to even number for horizontal moves
    snack_coord = get_random_value()& 0xFFFFFFFE;
    try_count++;
  }
  while(snake.has_collided_with(snack_coord) || snake.is_eating(snack_coord));
  video_memory_1d[snack_coord] = SNACK_CHAR;
}

Snake::Snake(){}

/*
  Returns the connector character that visually joins two snake segments
  whose directions differ (i.e. a turn). `from` is the direction the
  snake was traveling when it produced the turn cell as its head;
  `to` is the direction it is traveling now.

  Connector types (font bitmaps must be defined accordingly):
    - 1  └  opens right + below   (DOWN→RIGHT, LEFT→UP)
    - 2  ┘  opens left  + below   (DOWN→LEFT,  RIGHT→UP)
    - 3  ┐  opens left  + above   (UP→LEFT,    RIGHT→DOWN)
    - 4  ┌  opens right + above   (UP→RIGHT,   LEFT→DOWN)
*/
uint8_t Snake::turn_connector(direction from, direction to)
{
  if ((from == DOWN && to == RIGHT) || (from == LEFT && to == UP))
    return TYPE_1_CONNECTION_CHAR;
  if ((from == DOWN && to == LEFT) || (from == RIGHT && to == UP))
    return TYPE_2_CONNECTION_CHAR;
  if ((from == UP && to == LEFT) || (from == RIGHT && to == DOWN))
    return TYPE_3_CONNECTION_CHAR;
  if ((from == UP && to == RIGHT) || (from == LEFT && to == DOWN))
    return TYPE_4_CONNECTION_CHAR;
  return VER_TAIL_CHAR; // unreachable: straight or 180° (blocked by get_input)
}

void Snake::reset()
{
  head_index = 0;
  tail_index = 0;
  dir = RIGHT;
  prev_dir = RIGHT; // starting segment is straight, so no connector needed
  snake_coords[tail_index] = START_TAIL_COORD;
  for (size_t i = 0; i < START_TAIL_WIDTH; i++)
  {
    move_head();
  }
}

void Snake::get_input()
{
  uint8_t key;
  if (get_key(key))
  {
    if(state == PAUSED)
    {
      if(key == UNPAUSE_KEY)
      {
        do_game_unpause();
      }
      return;
    }
    state = ACTIVE;
    direction new_dir;
    new_dir = dir;
    switch (key)
    {
    case UP_KEY:
      new_dir = UP;
      break;
    case LEFT_KEY:
      new_dir = LEFT;
      break;
    case DOWN_KEY:
      new_dir = DOWN;
      break;
    case RIGHT_KEY:
      new_dir = RIGHT;
      break;
    case PAUSE_KEY:
      do_game_pause();
      break;
    }
    if(new_dir != -dir)
    {
      dir = new_dir;
    }
  }
}

size_t Snake::size()
{
  constexpr size_t N = WIN_LENGTH;
  size_t num_of_elements = ((head_index + 1) - tail_index + N) % N;
  return num_of_elements == 0 ? N : num_of_elements;
}

void Snake::move_head()
{
  size_t cur_pos = snake_coords[head_index];
  size_t new_pos = cur_pos + dir;

  // cur_pos (the old head) now becomes a permanent tail segment.
  // If the direction just changed, draw a turn connector; otherwise a
  // straight segment character.
  if (dir == prev_dir)
  {
    video_memory_1d[cur_pos] =
        (dir == UP || dir == DOWN) ? VER_TAIL_CHAR : HOR_TAIL_CHAR;
  }
  else
  {
    video_memory_1d[cur_pos] = turn_connector(prev_dir, dir);
  }

  // Horizontal step is 2 cells wide; fill the intermediate cell with a
  // plain horizontal segment (it is never a turn point itself).
  if (dir == RIGHT || dir == LEFT)
  {
    size_t mid = (dir == RIGHT) ? cur_pos + 1 : cur_pos - 1;
    video_memory_1d[mid] = HOR_TAIL_INTER_CHAR;
  }

  prev_dir = dir;
  head_index = (head_index + 1) % WIN_LENGTH;
  snake_coords[head_index] = new_pos;
  video_memory_1d[new_pos] = HEAD_CHAR;
}

void Snake::move_tail()
{
  size_t tail_pos = snake_coords[tail_index];
  size_t next_idx = (tail_index + 1) % WIN_LENGTH;
  size_t next_pos = snake_coords[next_idx];

  video_memory_1d[tail_pos] = SPACE_CHAR;

  // Recover the horizontal intermediate cell from consecutive entries.
  // int subtraction is safe: positions fit comfortably in int32 on this target.
  int diff = static_cast<int>(next_pos) - static_cast<int>(tail_pos);
  if (diff == 2)
  {
    video_memory_1d[tail_pos + 1] = SPACE_CHAR; // intermediate cell (right)
  }
  else if (diff == -2)
  {
    video_memory_1d[tail_pos - 1] = SPACE_CHAR; // intermediate cell (left)
  }
  // diff == ±WIDTH → vertical move, no intermediate cell to erase

  tail_index = next_idx;
}

bool Snake::is_eating(const size_t coord)
{
  return snake_coords[head_index] == coord;
}

bool Snake::has_collided_with(const size_t coord)
{
  size_t row = coord / WIDTH;
  if (row == 0 || row == HEIGHT - 1)
  {
    return true;
  }

  size_t col = coord % WIDTH;
  if (col == 0 || col == WIDTH - 1)
  {
    return true;
  }

  for (size_t i = tail_index; i != head_index; i = (i + 1) % WIN_LENGTH)
  {
    if (snake_coords[i] == coord)
    {
      return true;
    }
    // Check the intermediate cell between segment i and i+1
    size_t next_i = (i + 1) % WIN_LENGTH;
    int diff = static_cast<int>(snake_coords[next_i]) - static_cast<int>(snake_coords[i]);
    if ((diff == 2) && (coord == (snake_coords[i] + 1)))
      return true;
    if ((diff == -2) && (coord == (snake_coords[i] - 1)))
      return true;
  }

  return false;
}

bool Snake:: has_head_accident()
{
  return has_collided_with(snake_coords[head_index]);
}
