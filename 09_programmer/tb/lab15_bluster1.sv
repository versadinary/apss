/* -----------------------------------------------------------------------------
* Project Name   : Architectures of Processor Systems (APS) lab work
* Organization   : National Research University of Electronic Technology (MIET)
* Department     : Institute of Microdevices and Control Systems
* Author(s)      : Andrei Solodovnikov
* Email(s)       : hepoh@org.miet.ru

See https://github.com/MPSU/APS/blob/master/LICENSE file for licensing details.
* ------------------------------------------------------------------------------
*/
module lab_15_tb_bluster1();

  logic          clk_i;
  logic          rst_i;
  logic          rx_i;
  logic          tx_o;
  logic [ 31:0]  instr_addr_o;
  logic [ 31:0]  instr_wdata_o;
  logic          instr_we_o;
  logic [ 31:0]  data_addr_o;
  logic [ 31:0]  data_wdata_o;
  logic          data_we_o;
  logic          core_reset_o;

  logic rx_busy, rx_valid, tx_busy, tx_valid;
  logic [7:0] rx_data, tx_data;

  logic [31:0]   instr_addr_i;
  logic [31:0]   instr_rdata_o;

  import bluster_pkg::*;

  byte init_str[INIT_MSG_SIZE];
  byte done_str[FLASH_MSG_SIZE];

  always #50ns clk_i = !clk_i;
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
    clk_i = 0;
    rst_i <= 0;
    @(posedge clk_i);
    rst_i <= 1;
    repeat(2) @(posedge clk_i);
    rst_i <= 0;
    //program_region("lab_15_instr.mem", clk_i, tx_valid, rx_valid, tx_o, tx_busy, core_reset_o, rx_data, tx_data);
    //program_region("lab_15_data.mem", clk_i, tx_valid, rx_valid, tx_o, tx_busy, core_reset_o, rx_data, tx_data);
    //program_region("lab_15_char.mem", clk_i, tx_valid, rx_valid, tx_o, tx_busy, core_reset_o, rx_data, tx_data);
    //finish_programming(clk_i, tx_valid, tx_busy, core_reset_o, tx_data);
    
    // opening a file and store its data to mem register
    $display("\n%0t. Start programming %s", $time, fname);
    fd = $fopen(fname, "r");
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
    // send_data(str, clk_i, tx_valid, tx_busy, tx_data);
    // send start addr
    fork
    for(int i = str.size()-1; i >=0; i--) begin
      tx_data = str[i];
      tx_valid = 1'b1;
      @(posedge clk_i);
      tx_valid = 1'b0;
      @(posedge clk_i);
      while(tx_busy) @(posedge clk_i);
    end
    
    // rcv_data(INIT_MSG_SIZE, clk_i, rx_valid, tx_o, rx_data);
    for(int i = 0; i < INIT_MSG_SIZE; i++) begin
      @(posedge clk_i);
      while(!rx_valid)@(posedge clk_i);
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
      @(posedge clk_i);
      tx_valid = 1'b0;
      @(posedge clk_i);
      while(tx_busy) @(posedge clk_i);
    end
    
    // rcv_data(ACK_MSG_SIZE, clk_i, rx_valid, tx_o, rx_data);
    for(int i = 0; i < ACK_MSG_SIZE; i++) begin
      @(posedge clk_i);
      while(!rx_valid)@(posedge clk_i);
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
      @(posedge clk_i);
      tx_valid = 1'b0;
      @(posedge clk_i);
      while(tx_busy) @(posedge clk_i);
    end
    
    // rcv_data(FLASH_MSG_SIZE, clk_i, rx_valid, tx_o, rx_data);
    for(int i = 0; i < FLASH_MSG_SIZE; i++) begin
      @(posedge clk_i);
      while(!rx_valid)@(posedge clk_i);
      str_rcv[i] = rx_data;
      size_val[3-i] = rx_data;
    end
    join
    $display("%s", str_rcv[0:FLASH_MSG_SIZE-2]);
        assert((str_rcv[0:16] == "finished write 0x") && (str_rcv[25+:23] == " bytes starting from 0x"))begin end
        else $error("finish message format is incorrect. Should be \"finished write 0xSIZE bytes starting from 0xADDR\"");
        
    // FINISH INSTRUCTION MEMORY PROGRAMMING 
    repeat (150) @(posedge clk_i);
    // DATA MEMORY PROGRAMMING
    // opening a file and store its data to mem register
    fname = "lab_15_data.mem";
    $display("\n%0t. Start programming %s", $time, fname);
    fd = $fopen(fname, "r");
    assert(fd)
    else $fatal(1, "Can't open file %s", fname);
    void'($fscanf(fd, "@%x\w", start_addr));
    start_addr <<=2;
    while(!$feof(fd)) begin
      $fscanf(fd, "%x\w", data);
      mem_data.push_back(data[ 7: 0]);
      mem_data.push_back(data[15: 8]);
      mem_data.push_back(data[23:16]);
      mem_data.push_back(data[31:24]);
    end
    $fclose(fd);
    size = mem_data.size();
    str = {start_addr[7:0],start_addr[15:8],start_addr[23:16],start_addr[31:24]};
    // send_data(str, clk_i, tx_valid, tx_busy, tx_data);
    // send start addr
    fork
    for(int i = str.size()-1; i >=0; i--) begin
      tx_data = str[i];
      tx_valid = 1'b1;
      @(posedge clk_i);
      tx_valid = 1'b0;
      @(posedge clk_i);
      while(tx_busy) @(posedge clk_i);
    end
    
    // rcv_data(INIT_MSG_SIZE, clk_i, rx_valid, tx_o, rx_data);
    for(int i = 0; i < INIT_MSG_SIZE; i++) begin
      @(posedge clk_i);
      while(!rx_valid)@(posedge clk_i);
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
      @(posedge clk_i);
      tx_valid = 1'b0;
      @(posedge clk_i);
      while(tx_busy) @(posedge clk_i);
    end
    
    // rcv_data(ACK_MSG_SIZE, clk_i, rx_valid, tx_o, rx_data);
    for(int i = 0; i < ACK_MSG_SIZE; i++) begin
      @(posedge clk_i);
      while(!rx_valid)@(posedge clk_i);
      str_rcv[i] = rx_data;
      size_val[3-i] = rx_data;
    end
    join
    $display("%0d", size_val);
    // programming memory
    fork
    for(int i = mem_data.size()-1; i >=0; i--) begin
      tx_data = mem_data[i];
      tx_valid = 1'b1;
      @(posedge clk_i);
      tx_valid = 1'b0;
      @(posedge clk_i);
      while(tx_busy) @(posedge clk_i);
    end
    
    // rcv_data(FLASH_MSG_SIZE, clk_i, rx_valid, tx_o, rx_data);
    for(int i = 0; i < FLASH_MSG_SIZE; i++) begin
      @(posedge clk_i);
      while(!rx_valid)@(posedge clk_i);
      str_rcv[i] = rx_data;
      size_val[3-i] = rx_data;
    end
    join
    $display("%s", str_rcv[0:FLASH_MSG_SIZE-2]);
        assert((str_rcv[0:16] == "finished write 0x") && (str_rcv[25+:23] == " bytes starting from 0x"))begin end
        else $error("finish message format is incorrect. Should be \"finished write 0xSIZE bytes starting from 0xADDR\"");
        
        
    // FINISH DATA MEMORY PROGRAMMING
    
    repeat (150) @(posedge clk_i);
    
    // CHAR MEMORY PROGRAMMING
    
    fname = "lab_15_char.mem";
    $display("\n%0t. Start programming %s", $time, fname);
    fd = $fopen(fname, "r");
    assert(fd)
    else $fatal(1, "Can't open file %s", fname);
    void'($fscanf(fd, "@%x\w", start_addr));
    start_addr <<=2;
    while(!$feof(fd)) begin
      $fscanf(fd, "%x\w", data);
      mem_chara.push_back(data[ 7: 0]);
      mem_chara.push_back(data[15: 8]);
      mem_chara.push_back(data[23:16]);
      mem_chara.push_back(data[31:24]);
    end
    $fclose(fd);
    size = mem_chara.size();
    str = {start_addr[7:0],start_addr[15:8],start_addr[23:16],start_addr[31:24]};
    // send_data(str, clk_i, tx_valid, tx_busy, tx_data);
    // send start addr
    fork
    for(int i = str.size()-1; i >=0; i--) begin
      tx_data = str[i];
      tx_valid = 1'b1;
      @(posedge clk_i);
      tx_valid = 1'b0;
      @(posedge clk_i);
      while(tx_busy) @(posedge clk_i);
    end
    
    // rcv_data(INIT_MSG_SIZE, clk_i, rx_valid, tx_o, rx_data);
    for(int i = 0; i < INIT_MSG_SIZE; i++) begin
      @(posedge clk_i);
      while(!rx_valid)@(posedge clk_i);
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
      @(posedge clk_i);
      tx_valid = 1'b0;
      @(posedge clk_i);
      while(tx_busy) @(posedge clk_i);
    end
    
    // rcv_data(ACK_MSG_SIZE, clk_i, rx_valid, tx_o, rx_data);
    for(int i = 0; i < ACK_MSG_SIZE; i++) begin
      @(posedge clk_i);
      while(!rx_valid)@(posedge clk_i);
      str_rcv[i] = rx_data;
      size_val[3-i] = rx_data;
    end
    join
    $display("%0d", size_val);
    // programming memory
    fork
    for(int i = mem_chara.size()-1; i >=0; i--) begin
      tx_data = mem_chara[i];
      tx_valid = 1'b1;
      @(posedge clk_i);
      tx_valid = 1'b0;
      @(posedge clk_i);
      while(tx_busy) @(posedge clk_i);
    end
    
    // rcv_data(FLASH_MSG_SIZE, clk_i, rx_valid, tx_o, rx_data);
    for(int i = 0; i < FLASH_MSG_SIZE; i++) begin
      @(posedge clk_i);
      while(!rx_valid)@(posedge clk_i);
      str_rcv[i] = rx_data;
      size_val[3-i] = rx_data;
    end
    join
    $display("%s", str_rcv[0:FLASH_MSG_SIZE-2]);
        assert((str_rcv[0:16] == "finished write 0x") && (str_rcv[25+:23] == " bytes starting from 0x"))begin end
        else $error("finish message format is incorrect. Should be \"finished write 0xSIZE bytes starting from 0xADDR\"");
        
     // FINISH PROGRAMMING
     mem_finish.push_back(8'hff);
    mem_finish.push_back(8'hff);
    mem_finish.push_back(8'hff);
    mem_finish.push_back(8'hff);
    
    for(int i = mem_finish.size()-1; i >=0; i--) begin
      tx_data = mem_finish[i];
      tx_valid = 1'b1;
      @(posedge clk_i);
      tx_valid = 1'b0;
      @(posedge clk_i);
      while(tx_busy) @(posedge clk_i);
    end
    
    repeat (150) @(posedge clk_i);
    
    
    
    
    $finish();
  end


  bluster DUT(.*);

  uart_rx rx(
  .clk_i      (clk_i      ),
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
    .clk_i      (clk_i      ),
    .rst_i      (rst_i      ),
    .tx_o       (rx_i       ),
    .busy_o     (tx_busy    ),
    .baudrate_i (17'd115200 ),
    .parity_en_i(1'b1       ),
    .stopbit_i  (2'b1       ),
    .tx_data_i  (tx_data    ),
    .tx_valid_i (tx_valid   )
  );

  rw_instr_mem imem(
    .clk_i         (clk_i               ) ,
    .read_addr_i   (instr_addr_i        ) ,
    .read_data_o   (instr_rdata_o       ) ,
    .write_addr_i  (instr_addr_o        ) ,
    .write_data_i  (instr_wdata_o       ) ,
    .write_enable_i(instr_we_o          )
  );

  data_mem dmem(
    .clk_i          (clk_i                  ),
    .mem_req_i      (data_addr_o[31:24] == 0),
    .write_enable_i (data_we_o              ),
    .byte_enable_i  (4'b1111                ),
    .addr_i         (data_addr_o            ),
    .write_data_i   (data_wdata_o           ),
    .read_data_o    (),
    .ready_o        ()
  );

  data_mem cmem(
    .clk_i          (clk_i                  ),
    .mem_req_i      (data_addr_o[31:24] == 7),
    .write_enable_i (data_we_o              ),
    .byte_enable_i  (4'b1111                ),
    .addr_i         (data_addr_o            ),
    .write_data_i   (data_wdata_o           ),
    .read_data_o    (),
    .ready_o        ()
  );

endmodule