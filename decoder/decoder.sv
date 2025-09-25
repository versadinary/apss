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




endmodule //
