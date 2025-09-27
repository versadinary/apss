module processor_core(
                      input logic         clk_i,
                      input logic         rst_i,
                      input logic         stall_i,
                      input logic [31:0]  instr_i,
                      input logic [31:0]  mem_rd_i,
                      output logic [31:0] isntr_addr_o,
                      output logic [31:0] mem_addr_o,
                      output logic [2:0]  mem_size_o,
                      output logic        mem_req_o,
                      output logic        mem_we_o,
                      output logic [31:0] mem_wd_o
                      );

   import decoder_pkg::*;

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
   logic [31:0]                           alu_a, alu_b, alu_res;
   logic                                  alu_flag;

   // pc and constants
   logic [31:0]                           imm_i, imm_u, sel_imm,
                                          imm_s, imm_b, imm_j, pc,
                                          pc_mut, reg_jmp, pc_incr;

   // base assignment
   assign imm_i = {{20{instr_i[31]}}, instr_i[31:20]};
   assign imm_u = {instr_i[31:12], 12'b0};
   assign imm_s = {{20{instr_i[31]}}, instr_i[31:25], instr_i[11:7]};
   assign imm_b = {{19{instr_i[31]}}, instr_i[31], instr_i[7],
                   instr_i[30:25], instr_i[11:8], 1'b0};
   assign imm_j = {{11{instr_i[31]}}, instr_i[31], isntr_i[19:12],
                   instr_i[20], instr_i[30:21], 1'b0};
   assign instr_addr_o = pc;
   assign mem_wd_o = rf_rd2;
   assign mem_addr_o = alu_res;
   assign rf_we = dec_gpr_we & ~stall_i;

   // operate logic (right side of the diagram)
   always @ (*) begin
      case (dec_a_sel)
        OP_A_RS1: alu_a = rf_rd1;
        OP_A_CURR_PC: alu_a = pc;
        OP_A_ZERO: alu_a = 32'b0; // no default
      endcase // case (dec_a_sel)
      case (dec_b_sel)
        OP_B_RS2: alu_b = rf_rd2;
        OP_B_IMM_I: alu_b = imm_i;
        OP_B_IMM_U: alu_b = imm_u;
        OP_B_IMM_S: alu_b = imm_s;
        OP_B_INCR: alu_b = 32'd4; // no default mb illegal_instr handle it but idk
      endcase // case (dec_b_sel)
      case (dec_wb_sel)
        WB_EX_RESULT: wb_data = alu_res;
        WB_LSU_DATA: wb_data = mem_rd_i;
      endcase // case (dec_wb_sel)
   end

   // program_counter logic
   assign sel_imm = dec_branch ? imm_b : imm_j;
   assign pc_incr = (dec_jal | alu_flag & dec_branch);

   always @ (posedge clk_i or posedge rst_i) begin
      if (rst_i) pc <= 32'd0;
      else begin
         if (~stall_i) pc <= dec_jalr ? reg_jmp : pc_mut;
         else pc <= pc;
      end
   end

   // instantiating
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

   alu alu_main(
                .a_i(alu_a),
                .b_i(alu_b),
                .alu_op_i(dec_alu_op),
                .flag_o(alu_flag),
                .result_o(alu_res)
                );

   fulladder32 fadd_pc(
                       .a_i(pc),
                       .b_i(pc_incr),
                       .carry_i(1'b0),
                       .sum_o(pc_mut)
                       // .carry_o()
                       );

   fulladder32 fadd_jalr(
                         .a_i(rf_rd1),
                         .b_i(imm_i),
                         .carry_i(1'b0),
                         .sum_o(reg_jmp)
                         // .carry_o()
                         );

endmodule // processor_core
