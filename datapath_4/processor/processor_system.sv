module processor_system(
                        input logic clk_i,
                        input logic rst_i
                        );

   logic                            stall, stall_tg, mwe, mreq;
   logic [31:0]                     mwd, maddr, mrd, rom_ins, rom_addr;

   assign stall = ~stall_tg & mreq;

   always @ (posedge clk_i or posedge rst_i) begin
      if (rst_i) stall_tg <= 1'd0;
      else stall_tg <= stall;
   end

   processor_core core(
                       .clk_i(clk_i),
                       .rst_i(rst_i),
                       .stall_i(stall),
                       .instr_i(rom_ins),
                       .mem_rd_i(mrd),
                       .instr_addr_o(rom_addr),
                       .mem_addr_o(maddr),
                       // .mem_size_o(),
                       .mem_req_o(mreq),
                       .mem_we_o(mwe),
                       .mem_wd_o(mwd)
                       );

   instr_mem imem(
                  .read_addr_i(rom_addr),
                  .read_data_o(rom_ins)
                  );

   data_mem dmem(
                 .clk_i(clk_i),
                 .mem_req_i(mreq),
                 .write_enable_i(mwe),
                 .byte_enable_i(4'b1111),
                 .addr_i(maddr),
                 .write_data_i(mwd),
                 .read_data_o(mrd)
                 // .ready_o()
                 );

endmodule // processor_system
