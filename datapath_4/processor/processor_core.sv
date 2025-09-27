module processor_core(
                      input logic         clk_i,
                      input logic         rst_i,
                      input logic         stall_i,
                      input logic [31:0]  instr_i,
                      input logic [31:0]  mem_rd,
                      output logic [31:0] isntr_addr_o,
                      output logic [31:0] mem_addr_o,
                      output logic [2:0]  mem_size_o,
                      output logic        mem_req_o,
                      output logic        mem_we_o,
                      output logic [31:0] mem_wd_o
                      );

   // register file signals
   logic [31:0]                           rf_rd1;
   logic [31:0]                           rf_rd2;
   logic [4:0]                            rf_ra1;
   logic [4:0]                            rf_ra2;
   logic [4:0]                            rf_wa;
   logic [31:0]                           wb_data;
   logic                                  rf_we;


endmodule // processor_core
