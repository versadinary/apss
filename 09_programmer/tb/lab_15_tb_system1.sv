/* -----------------------------------------------------------------------------
* Project Name   : Architectures of Processor Systems (APS) lab work
* Organization   : National Research University of Electronic Technology (MIET)
* Department     : Institute of Microdevices and Control Systems
* Author(s)      : Andrei Solodovnikov
* Email(s)       : hepoh@org.miet.ru

See https://github.com/MPSU/APS/blob/master/LICENSE file for licensing details.
* ------------------------------------------------------------------------------
*/
module lab_15_tb_system1();

  logic          clk_i;
  logic          sysclk;
  logic          rst_i;
  logic          flash_rx;
  logic          tx_o;
  logic ps2_clk, ps2_dat;
  logic [15:0] sw_i;
  logic tb_rx;
  logic flashing_is_done = 0;
  logic core_reset;

  logic rx_busy, rx_valid, tx_busy, tx_valid;
  logic [7:0] rx_data, tx_data;

  import bluster_pkg::*;
  import peripheral_pkg::*;

  byte init_str[INIT_MSG_SIZE];
  byte done_str[FLASH_MSG_SIZE];

  always #5ns clk_i = !clk_i;
  always #50ns sysclk = !sysclk;
  //////////////////////////////////////////////////////////////////////////
   int fd, start_addr;
     logic [31:0] data;
     byte mem[$];
     byte mem_data[$];
     byte mem_chara[$];
     byte mem_finish[$];
     byte str [$];
     logic [3:0][7:0] size;
     string fname = "lab_15_instr.mem";
     logic [0:FLASH_MSG_SIZE-1][7:0] str_rcv;
     logic [3:0][7:0] size_val;
     int size1;
  
  
  /////////////////////////////////////////////////////////////////////////



  initial begin
    $timeformat(-9, 2, " ns", 3);
    sysclk = 0;
    clk_i = 0;
    rst_i <= 0;
    @(posedge sysclk);
    rst_i <= 1;
    repeat(2) @(posedge sysclk);
    rst_i <= 0;
    // program_region("init_instr.mem", sysclk, tx_valid, rx_valid, tx_o, tx_busy, core_reset, rx_data, tx_data);
    // program_region("YOUR_DATA_MEM_FILE.mem", sysclk, tx_valid, rx_valid, tx_o, tx_busy, core_reset, rx_data, tx_data);
    // finish_programming(sysclk, tx_valid, tx_busy, core_reset, tx_data);
    $display("\n%0t. Start programming %s", $time, fname);
    fd = $fopen("lab13_ps2_hex_instr.mem", "r");
    assert(fd)
    else $fatal(1, "Can't open file %s", fname);
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
    size = mem.size();
    str = {start_addr[7:0],start_addr[15:8],start_addr[23:16],start_addr[31:24]};
    // send_data(str, sysclk, tx_valid, tx_busy, tx_data);
    // send start addr
    fork
    for(int i = str.size()-1; i >=0; i--) begin
      tx_data = str[i];
      tx_valid = 1'b1;
      @(posedge sysclk);
      tx_valid = 1'b0;
      @(posedge sysclk);
      while(tx_busy) @(posedge sysclk);
    end
    
    // rcv_data(INIT_MSG_SIZE, sysclk, rx_valid, tx_o, rx_data);
    for(int i = 0; i < INIT_MSG_SIZE; i++) begin
      @(posedge sysclk);
      while(!rx_valid)@(posedge sysclk);
      str_rcv[i] = rx_data;
      size_val[3-i] = rx_data;
    end
    join
    $display("\"%s\"", str_rcv[0:INIT_MSG_SIZE-2]);
        assert(str_rcv[0:INIT_MSG_SIZE-10] == "ready for flash starting from 0x")begin end
        else $error("Init message format is incorrect. Should be \"ready for flash starting from 0xADDR\"");
    // send size of a memory
    str = {size[0],size[1],size[2],size[3]};
    fork
    for(int i = str.size()-1; i >=0; i--) begin
      tx_data = str[i];
      tx_valid = 1'b1;
      @(posedge sysclk);
      tx_valid = 1'b0;
      @(posedge sysclk);
      while(tx_busy) @(posedge sysclk);
    end
    
    // rcv_data(ACK_MSG_SIZE, sysclk, rx_valid, tx_o, rx_data);
    for(int i = 0; i < ACK_MSG_SIZE; i++) begin
      @(posedge sysclk);
      while(!rx_valid)@(posedge sysclk);
      str_rcv[i] = rx_data;
      size_val[3-i] = rx_data;
    end
    join
    $display("%0d", size_val);
    // programming memory
    fork
    for(int i = mem.size()-1; i >=0; i--) begin
      tx_data = mem[i];
      tx_valid = 1'b1;
      @(posedge sysclk);
      tx_valid = 1'b0;
      @(posedge sysclk);
      while(tx_busy) @(posedge sysclk);
    end
    
    // rcv_data(FLASH_MSG_SIZE, sysclk, rx_valid, tx_o, rx_data);
    for(int i = 0; i < FLASH_MSG_SIZE; i++) begin
      @(posedge sysclk);
      while(!rx_valid)@(posedge sysclk);
      str_rcv[i] = rx_data;
      size_val[3-i] = rx_data;
    end
    join
    $display("%s", str_rcv[0:FLASH_MSG_SIZE-2]);
        assert((str_rcv[0:16] == "finished write 0x") && (str_rcv[25+:23] == " bytes starting from 0x"))begin end
        else $error("finish message format is incorrect. Should be \"finished write 0xSIZE bytes starting from 0xADDR\"");
        
    // FINISH INSTRUCTION MEMORY PROGRAMMING 
    //
// FINISH PROGRAMMING
     mem_finish.push_back(8'hff);
    mem_finish.push_back(8'hff);
    mem_finish.push_back(8'hff);
    mem_finish.push_back(8'hff);
    
    for(int i = mem_finish.size()-1; i >=0; i--) begin
      tx_data = mem_finish[i];
      tx_valid = 1'b1;
      @(posedge sysclk);
      tx_valid = 1'b0;
      @(posedge sysclk);
      while(tx_busy) @(posedge sysclk);
    end


    repeat(200) @(posedge sysclk);
    flashing_is_done = 1;
    #4ms;
    $finish();
  end

  initial begin: sw_block
    sw_i = 16'd0;
    wait(flashing_is_done);
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
    wait(flashing_is_done);
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
    tb_rx = 1'b1;
    wait(flashing_is_done);
    uart_rx_send_char(8'h1c, 115200, tb_rx);
    repeat(1000) @(posedge clk_i);
    uart_rx_send_char(8'h0D, 115200, tb_rx);
    repeat(1000) @(posedge clk_i);
    uart_rx_send_char(8'h0D, 115200, tb_rx);
    repeat(1000) @(posedge clk_i);
    uart_rx_send_char(8'h7F, 115200, tb_rx);
    repeat(1000) @(posedge clk_i);
    uart_rx_send_char(8'h7F, 115200, tb_rx);
  end


  processor_system DUT(
    .clk_i    (clk_i  ),
    .resetn_i (!rst_i ),
    .rx_i     (flashing_is_done ? tb_rx : flash_rx ),
    .tx_o     (tx_o   ),
    .kclk_i   (ps2_clk),
    .kdata_i  (ps2_dat),
    .sw_i     (sw_i   )
  );

  assign core_reset = DUT.core_inst.rst_i;

  uart_rx rx(
  .clk_i      (sysclk     ),
  .rst_i      (rst_i      ),
  .rx_i       (tx_o       ),
  .busy_o     (rx_busy    ),
  .baudrate_i (17'd115200 ),
  .parity_en_i(1'b1       ),
  .stopbit_i  (2'b1       ),
  .rx_data_o  (rx_data    ),
  .rx_valid_o (rx_valid   )
  );

  uart_tx tx(
    .clk_i      (sysclk     ),
    .rst_i      (rst_i      ),
    .tx_o       (flash_rx   ),
    .busy_o     (tx_busy    ),
    .baudrate_i (17'd115200 ),
    .parity_en_i(1'b1       ),
    .stopbit_i  (2'b1       ),
    .tx_data_i  (tx_data    ),
    .tx_valid_i (tx_valid   )
  );

endmodule
