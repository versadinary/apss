module processor_system(
                        input logic clk_i,
                        input logic rst_i
                        );

   logic                            stall, stall_tg, mwe, mreq;
   logic [31:0]                     mwd, maddr, mrd, rom_ins, rom_addr;
   logic [2:0]                      msize;
   logic                            dmem_req, dmem_we, dmem_rd, ready;
   logic [3:0]                      dmem_be;
   logic [31:0]                     dmem_wd, dmem_a;

   processor_core core(
                       .clk_i(clk_i),
                       .rst_i(rst_i),
                       .stall_i(stall),
                       .instr_i(rom_ins),
                       .mem_rd_i(mrd),
                       .instr_addr_o(rom_addr),
                       .mem_addr_o(maddr),
                       .mem_size_o(msize),
                       .mem_req_o(mreq),
                       .mem_we_o(mwe),
                       .mem_wd_o(mwd)
                       );

   lsu lsu_main(
                .clk_i(clk_i),
                .rst_i(rst_i),
                .core_req_i(mreq),
                .core_we_i(mwe),
                .core_size_i(msize),
                .core_addr_i(maddr),
                .core_wd_i(mwd),
                .core_rd_o(mrd),
                .core_stall_o(stall),
                .mem_req_o(dmem_req),
                .mem_we_o(dmem_we),
                .mem_be_o(dmem_be),
                .mem_addr_o(dmem_a),
                .mem_wd_o(dmem_wd),
                .mem_rd_i(dmem_rd),
                .mem_ready_i(ready)
                );

   instr_mem imem(
                  .read_addr_i(rom_addr),
                  .read_data_o(rom_ins)
                  );

   data_mem dmem(
                 .clk_i(clk_i),
                 .mem_req_i(dmem_req),
                 .write_enable_i(dmem_we),
                 .byte_enable_i(dmem_be),
                 .addr_i(dmem_a),
                 .write_data_i(dmem_wd),
                 .read_data_o(dmem_rd),
                 .ready_o(ready)
                 );

endmodule // processor_system
