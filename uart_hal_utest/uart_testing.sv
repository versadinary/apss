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

  logic        clk100mhz_i;
  logic        aresetn_i;
  logic        rx_i;
  logic        tx_o;
  logic        clk_i;
  logic        rst_i;
  logic ps2_clk;
  logic ps2_dat;
  
  import peripheral_pkg::*;

  assign aresetn_i = !rst_i;
  

  logic rx_busy, rx_valid, tx_busy, tx_valid;
  logic [7:0] rx_data, tx_data;

  always #50ns clk_i = !clk_i;
  always #5ns clk100mhz_i = !clk100mhz_i;

  byte coremark_msg[103];
  integer coremark_cntr;
  logic core_reset;
  assign core_reset = DUT.rst_bl;
  logic [7:0] data_from_system;
  
  int fd, start_addr;
  logic [31:0] data;
  byte mem [$];
  byte str [$];
  logic [3:0][7:0] size;
  string INSTR = "rx_tx_test_instr.mem";
  string DATA = "rx_tx_test_data.mem";

  initial begin
    $timeformat(-9, 2, " ns", 3);
    clk100mhz_i = 0;
    coremark_cntr = 0;
    for (int i = 0; i < 103; i++) coremark_msg[i] = 32;
    clk_i = 0;
    rst_i = 0;
    @(posedge clk_i);
    rst_i <= 1;
    repeat(2) @(posedge clk_i);
    rst_i <= 0;
    ps2_clk = 1'b1;
    ps2_dat = 1'b1;
    
    //prog(INSTR);
    //prog(DATA);
    finish_programming();
    
    repeat(200) @ (posedge clk_i);
    get_data();
    $display("%t RECEIVED DATA: %h", $time, data_from_system);
    send_data({data_from_system});
    $display("TX FINISHED %h @ %t",~data_from_system, $time);
    @ (posedge clk_i);
    forever begin
      @(posedge clk_i);
      if(rx_valid) begin
        if((rx_data == 10) | (rx_data == 13)) begin
          $display("%s", coremark_msg);
          coremark_cntr = 0;
          for (int i = 0; i < 103; i++) coremark_msg[i] = 32;
          $finish();
        end
        else begin
          coremark_msg[coremark_cntr] = rx_data;
          coremark_cntr++;
        end
      end
    end
    
    repeat (600) @ (posedge clk_i);
    $finish();
   
  end

  processor_system DUT(
    .clk_i      (clk100mhz_i), 
    .resetn_i   (aresetn_i), 
    .rx_i       (rx_i),
     .kclk_i   (ps2_clk),
    .kdata_i  (ps2_dat),
    .tx_o       (tx_o)
);

  uart_rx rx(
  .clk_i      (clk_i      ),
  .rst_i      (rst_i      ),
  .rx_i       (tx_o       ),
  .busy_o     (rx_busy    ),
  .baudrate_i (17'd115200 ),
  .parity_en_i(1'b1       ),
  .stopbit_i  (1'b1       ),
  .rx_data_o  (rx_data    ),
  .rx_valid_o (rx_valid   )
);

uart_tx tx(
  .clk_i      (clk_i      ),
  .rst_i      (rst_i      ),
  .tx_o       (rx_i       ),
  .busy_o     (tx_busy    ),
  .baudrate_i (17'd115200 ),
  .parity_en_i(1'b1       ),
  .stopbit_i  (1'b1       ),
  .tx_data_i  (tx_data    ),
  .tx_valid_i (tx_valid   )
);

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

task get_data();
    @ (posedge clk_i);
    while(!rx_valid) @ (posedge clk_i);
    data_from_system = rx_data;
    wait(tx_o);
endtask

task rcv_data(input int size);
  byte str[57];
  logic [3:0][7:0] size_val;
  for(int i = 0; i < size; i++) begin
    @(posedge clk_i);
    while(!rx_valid)@(posedge clk_i);
    str[i] = rx_data;
    size_val[3-i] = rx_data;
  end
  if(size!=4)$display("%s", str);
  else $display("%d", size_val);
  wait(tx_o);
endtask

task program_region(input byte mem[$], input logic [3:0][7:0] start_addr);
  byte str [4];
  logic [3:0][7:0] size;
  size = mem.size();
  str = {start_addr[0],start_addr[1],start_addr[2],start_addr[3]};
  send_data(str);
  rcv_data(40);
  str = {size[0],size[1],size[2],size[3]};
  send_data(str);
  rcv_data(4);
  send_data(mem);
  rcv_data(57);

endtask

task prog(input string filename);
    mem.delete();
    fd = $fopen(filename, "r");
    assert(fd)
    else $fatal(1, "Can't open file %s", filename);
    void'($fscanf(fd, "@%x\w", start_addr));
    start_addr <<=2;
    while(!$feof(fd)) begin
      $fscanf(fd, "%x\w", data);
      mem.push_back(data[ 7: 0]);
      mem.push_back(data[15: 8]);
      mem.push_back(data[23:16]);
      mem.push_back(data[31:24]);
    end
    $fclose(fd);
    program_region(mem, start_addr);
endtask

task finish_programming();
  send_data({8'hff, 8'hff, 8'hff, 8'hff});
endtask

task dummy_programming();
  byte str [4] = {8'd0, 8'd0, 8'd0, 8'd0};
  send_data(str);
  rcv_data(40);
  send_data(str);
  rcv_data(4);
  // send_data(str);
  rcv_data(57);
  // send_data(str);
endtask

endmodule
