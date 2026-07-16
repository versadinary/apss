/* -----------------------------------------------------------------------------
* Project Name   : Architectures of Processor Systems (APS) lab work
* Organization   : National Research University of Electronic Technology (MIET)
* Department     : Institute of Microdevices and Control Systems
* Author(s)      : Andrei Solodovnikov
* Email(s)       : hepoh@org.miet.ru

See https://github.com/MPSU/APS/blob/master/LICENSE file for licensing details.
* ------------------------------------------------------------------------------
*/
module lab_13_tb_processor_system();

import peripheral_pkg::*;

logic clk_i;
logic resetn;
logic [15:0] sw_i;
logic [15:0] led_o;
logic ps2_clk;
logic ps2_dat;
logic rst_i;

logic [ 6:0] hex_led_o;
logic [ 7:0] hex_sel_o;
logic        rx_i;
logic        tx_o;
initial begin
    // clk100mhz_i = 0;
    //clk_i = 0;
    rst_i <= 0;
    @(posedge clk_i);
    rst_i <= 1;
    repeat(2) @(posedge clk_i);
    rst_i <= 0;
 end


initial begin clk_i = 0; end
always #5ns clk_i = ~clk_i;
logic rx_busy, rx_valid, tx_busy, tx_valid;
  logic [7:0] rx_data, tx_data;

initial #40ms $finish();


initial begin
  resetn = 1;
  repeat(20)@(posedge clk_i);
  resetn = 0;
  repeat(20) @(posedge clk_i);
  resetn = 1;
  
    // finish_programming();
end

processor_system DUT(
  .clk_i    (clk_i    ),
  .resetn_i (resetn   ),
  .sw_i     (sw_i     ),
  .led_o    (led_o    ),
  .kclk_i   (ps2_clk  ),
  .kdata_i  (ps2_dat  ),
  .hex_led_o(hex_led_o),
  .hex_sel_o(hex_sel_o),
  .rx_i     (rx_i     ),
  .tx_o     (tx_o     )
);

logic core_reset = DUT.rst_bl;



initial begin: sw_block
  sw_i = 16'd0;
  repeat(1000) @(posedge clk_i);
  sw_i = 16'hdead;
  repeat(1000) @(posedge clk_i);
  sw_i = 16'h5555;
  repeat(1000) @(posedge clk_i);
  sw_i = 16'hbeef;
  repeat(1000) @(posedge clk_i);
  sw_i = 16'haaaa;
end

initial begin: ps2_initial_block
  ps2_clk = 1'b1;
  ps2_dat = 1'b1;
  repeat(1000) @(posedge clk_i);
  ps2_send_scan_code(8'h1C, ps2_clk, ps2_dat);
  repeat(1000) @(posedge clk_i);
  ps2_send_scan_code(8'hf0, ps2_clk, ps2_dat);
  repeat(1000) @(posedge clk_i);
  ps2_send_scan_code(8'h1C, ps2_clk, ps2_dat);
  repeat(1000) @(posedge clk_i);
  ps2_send_scan_code(8'h32, ps2_clk, ps2_dat);
  repeat(1000) @(posedge clk_i);
  ps2_send_scan_code(8'hf0, ps2_clk, ps2_dat);
  repeat(1000) @(posedge clk_i);
  ps2_send_scan_code(8'h32, ps2_clk, ps2_dat);
  repeat(1000) @(posedge clk_i);
  ps2_send_scan_code(8'h21, ps2_clk, ps2_dat);
  repeat(1000) @(posedge clk_i);
  ps2_send_scan_code(8'hf0, ps2_clk, ps2_dat);
  repeat(1000) @(posedge clk_i);
  ps2_send_scan_code(8'h21, ps2_clk, ps2_dat);
end

initial begin: uart_rx_initial_block
  // wait(core_reset);
  rx_i = 1'b1;
  uart_rx_send_char(8'hff, 115200, rx_i);
  uart_rx_send_char(8'hff, 115200, rx_i);
  uart_rx_send_char(8'hff, 115200, rx_i);
  uart_rx_send_char(8'hff, 115200, rx_i);
  repeat(1000) @(posedge clk_i);
  uart_rx_send_char(8'h1c, 115200, rx_i);
  repeat(1000) @(posedge clk_i);
  uart_rx_send_char(8'h0D, 115200, rx_i);
  repeat(1000) @(posedge clk_i);
  uart_rx_send_char(8'h0D, 115200, rx_i);
  repeat(1000) @(posedge clk_i);
  uart_rx_send_char(8'h7F, 115200, rx_i);
  repeat(1000) @(posedge clk_i);
  uart_rx_send_char(8'h7F, 115200, rx_i);
end


task finish_programming();
  send_data({8'hff, 8'hff, 8'hff, 8'hff});
endtask

task send_data(input byte mem[$]);
  for(int i = mem.size()-1; i >=0; i--) begin
    tx_data = mem[i];
    tx_valid = 1'b1;
    @(posedge clk_i);
    tx_valid = 1'b0;
    @(posedge clk_i);
    while(tx_busy) @(posedge clk_i);
  end
endtask

endmodule
