/* -----------------------------------------------------------------------------
* Project Name   : Architectures of Processor Systems (APS) lab work
* Organization   : National Research University of Electronic Technology (MIET)
* Department     : Institute of Microdevices and Control Systems
* Author(s)      : Andrei Solodovnikov
* Email(s)       : hepoh@org.miet.ru

See https://github.com/MPSU/APS/blob/master/LICENSE file for licensing details.
* ------------------------------------------------------------------------------
*/
module uart_testing();

import peripheral_pkg::*;

logic clk_i;
logic resetn;
logic [15:0] sw_i;
logic [15:0] led_o;
logic ps2_clk;
logic ps2_dat;
logic rst_i;
logic sysclk;

logic [ 6:0] hex_led_o;
logic [ 7:0] hex_sel_o;
logic        rx_i;
logic        tx_o;
logic core_reset;
assign core_reset = DUT.rst_bl;

initial begin
    rst_i <= 0;
    @(posedge clk_i);
    rst_i <= 1;
    repeat(2) @(posedge clk_i);
    rst_i <= 0;
end

initial begin 
    clk_i = 0;
    sysclk = 0;
end
always #50ns sysclk = ~sysclk;
always #5ns clk_i = ~clk_i;

logic rx_busy, rx_valid, tx_busy, tx_valid;
logic [7:0] rx_data, tx_data;

initial #3ms $finish();

logic [7:0] send_data;
logic data_valid;
assign tx_valid = data_valid;
logic [7:0] receive_data;
logic rcv_valid;
assign receive_data = rx_data;
assign rcv_valid = rx_valid;

initial begin
    resetn = 1;
    repeat(20) @(posedge clk_i);
    resetn = 0;
    repeat(20) @(posedge clk_i);
    resetn = 1;
    for (int i = 0; i < 4; i++) send_byte_uart(8'hff);
    
    for (int i = 0; i < 3; i++) begin
        while(!rx_valid) @(posedge sysclk);
        send_byte_uart(~receive_data);
    end
    
end

processor_system DUT(
  .clk_i    (clk_i    ),
  .resetn_i (resetn   ),
  .sw_i     (sw_i     ),
  .led_o    (led_o    ),
  .kclk_i  (ps2_clk  ),
  .kdata_i  (ps2_dat  ),
  .hex_led_o(hex_led_o),
  .hex_sel_o(hex_sel_o),
  .rx_i     (rx_i     ),
  .tx_o     (tx_o     )
);

uart_rx rcv_from_ps(
  .clk_i      (sysclk      ),
  .rst_i      (rst_i      ),
  .rx_i       (tx_o       ),
  .busy_o     (rx_busy    ),
  .baudrate_i (17'd115200 ),
  .parity_en_i(1'b1       ),
  .stopbit_i  (1'b1       ),
  .rx_data_o  (rx_data    ),
  .rx_valid_o (rx_valid   )
);

uart_tx snd_to_ps (
 .clk_i(sysclk),
 .rst_i(rst_i),
 .tx_o(rx_i),
 .busy_o(tx_busy),
 .baudrate_i(17'd115200),
 .parity_en_i(1'b1),
 .stopbit_i(1'b1),
 .tx_data_i(send_data),
 .tx_valid_i(data_valid)
);

task send_byte_uart(input logic [7:0] data);
    send_data = data;
    data_valid = 1'b1;
    @ (posedge sysclk);
    while (tx_busy) @ (posedge sysclk);
    data_valid = 1'b0;
    @ (posedge sysclk);
    
endtask

endmodule

