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
   logic [31:0]                           rf_rd1, rf_rd2, wb_data;
   logic [4:0]                            rf_ra1, rf_ra2, rf_wa;
   logic                                  rf_we;

   // decoder signals
   logic [2:0]                            dec_mem_size, dec_b_sel;
   logic [1:0]                            dec_wb_sel, dec_a_sel;
   logic [4:0]                            dec_alu_op;
   logic                                  dec_jalr, dec_jal, dec_branch;
   logic                                  dec_mem_req, dec_mem_we_o;



endmodule // processor_core
