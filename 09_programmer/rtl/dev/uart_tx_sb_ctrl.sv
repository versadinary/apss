module uart_tx_sb_ctrl(
/*
    Часть интерфейса модуля, отвечающая за подключение к системной шине
*/
  input  logic          clk_i,
  input  logic          rst_i,
  input  logic [31:0]   addr_i,
  input  logic          req_i,
  input  logic [31:0]   write_data_i,
  input  logic          write_enable_i,
  output logic [31:0]   read_data_o,

/*
    Часть интерфейса модуля, отвечающая за подключение передающему,
    выходные данные по UART
*/
  output logic          tx_o
);

  logic busy;
  logic [16:0] baudrate;
  logic parity_en;
  logic [1:0] stopbit;
  logic [7:0]  data;

endmodule
