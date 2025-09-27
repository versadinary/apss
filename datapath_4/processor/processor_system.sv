module processor_system(
                        input logic clk_i,
                        input logic rst_i,
                        );

   logic                            stall;


   processor_core core(
                       .clk_i(clk_i),
                       .rst_i(rst_i),
                       .stall_i(stall),
                       .instr_i(),
                       .mem_rd_i(),
                       .isntr_addr_o(),
                       .mem_addr_o(),
                       .mem_size_o(),
                       .mem_req_o(),
                       .mem_we_o(),
                       .mem_wd_o()
                       );

   instr_mem imem(
                  .read_addr_i(),
                  .read_data_o()
                  );

   data_mem dmem(
                 .clk_i(clk_i),
                 .mem_req_i(),
                 .write_enable_i(),
                 .byte_enable_i(),
                 .addr_i(),
                 .write_data_i(),
                 .read_data_o(),
                 .ready_o()
                 );

endmodule // processor_system
