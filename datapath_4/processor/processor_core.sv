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
   logic [2:0]                            dec_b_sel;
   logic [1:0]                            dec_wb_sel, dec_a_sel;
   logic [4:0]                            dec_alu_op;
   logic                                  dec_jalr, dec_jal, dec_branch, dec_gpr_we;

   // alu signal
   logic                                  alu_flag;

   decoder main_decoder(
                        .fetched_instr_i(instr_i),
                        .a_sel_o(dec_a_sel),
                        .b_sel_o(dec_b_sel),
                        .alu_op_o(dec_alu_op),
                         // .csr_op_o(),
                         // .csr_we_o(),
                        .mem_req_o(mem_req_o),
                        .mem_we_o(mem_we_o),
                        .mem_size_o(mem_size_o),
                        .gpr_we_o(dec_gpr_we),
                        .wb_sel_o(dec_wb_sel),
                         // .illegal_instr_o(),
                        .branch_o(dec_branch),
                        .jal_o(dec_jal),
                        .jalr_o(dec_jalr),
                         // .mret_o()
                        );

   register_file rf_main(
                         .clk_i(clk_i),
                         .write_enable_i(rf_we),
                         .write_addr_i(rf_wa),
                         .read_addr1_i(rf_ra1),
                         .read_addr2_i(rf_ra2),
                         .write_data_i(wb_data),
                         .read_data1_o(rf_rd1),
                         .read_data2_o(rf_rd2)
                         );



endmodule // processor_core
