module decoder (
                input logic [31:0] fetcher_instr_i,
                output logic [1:0] a_sel_o,
                output logic [2:0] b_sel_o,
                output logic [4:0] alu_op_o,
                output logic [2:0] csr_op_o,
                output logic       csr_we_o,
                output logic       mem_req_o,
                output logic       mem_we_o,
                output logic [2:0] mem_size_o,
                output logic       gpr_we_o,
                output logic [1:0] wb_sel_o,
                output logic       illegal_instr_o,
                output logic       branch_o,
                output logic       jal_o,
                output logic       jalr_o,
                output logic       mret_o
                );

   import decoder_pkg::*;

   logic [6:0]                     opcode;
   logic [2:0]                     func3;
   logic [6:0]                     func7;

   assign opcode = fetcher_instr_i[6:0];
   assign func3 = fetcher_instr_i[14:12];
   assign func7 = fetcher_instr_i[31:25];

   always @ (*) begin
      a_sel_o = 2'd0;
      b_sel_o = 3'd0;
      alu_op_o = 5'd0;
      csr_op_o = 3'd0;
      csr_we_o = 1'd0;
      mem_req_o = 1'd0;
      mem_size_o = 3'd0;
      gpr_we_o = 1'd0;
      wb_sel_o = 2'd0;
      branch_o = 1'd0;
      jal_o = 1'd0;
      jalr_o = 1'd0;
      mret_o = 1'd0;
      illegal_instr_o = &opcode[1:0]; // in next usages dusjunct with this vaule
      case (opcode[6:2])
        OP_OPCODE: begin
           gpr_we_o = 1'd1;
           wb_sel_o = WB_EX_RESULT;
        end
        OP_IMM_OPCODE: begin

        end
        LOAD_OPCODE: begin

        end
        STORE_OPCODE: begin

        end
        BRANCH_OPCODE: begin

        end
        JAL_OPCODE: begin

        end
        JALR_OPCODE: begin

        end
        LUI_OPCODE: begin

        end
        AUIPC_OPCODE: begin

        end
        MISC_MEM_OPCODE: begin

        end
        SYSTEM_OPCODE: begin

        end
        default: begin

        end
      endcase // case (opcode)

   end

endmodule 
