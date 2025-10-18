module csr_constroller(
                       input logic         clk_i,
                       input logic         rst_i,
                       input logic         trap_i,

                       input logic [2:0]   opcode_i,

                       input logic [11:0]  addr_i,
                       input logic [31:0]  pc_i,
                       input logic [31:0]  mcause_i,
                       input logic [31:0]  rs1_data_i,
                       input logic [31:0]  imm_data_i,
                       input logic         write_enable_i,

                       output logic [31:0] read_data_o,
                       output logic [31:0] mie_o,
                       output logic [31:0] mepc_o,
                       output logic [31:0] mtvec_o
                       );

   import csr_pkg::*;

   logic                                   reg_data;
   logic                                   csr;

   always @ (*) begin
      case (opcode_i)
        CSR_RW: csr = rs1_data_i;
        CSR_RS: csr
      endcase // case (opcode_i)
   end


endmodule // csr_constroller
