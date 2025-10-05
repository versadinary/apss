module lsu(
           input logic         clk_i,
           input logic         rst_i,

           // core interface
           input logic         core_req_i,
           input logic         core_we_i,
           input logic [2:0]   core_size_i,
           input logic [31:0]  core_addr_i,
           input logic [31:0]  core_wd_i,
           output logic [31:0] core_rd_o,
           output logic        core_stall_o,

           // data memory interface
           output logic        mem_req_o,
           output logic        mem_we_o,
           output logic [3:0]  mem_be_o,
           output logic [31:0] mem_addr_o,
           output logic [31:0] mem_wd_o,
           input logic [31:0]  mem_rd_i,
           input logic         mem_ready_i
           );

   import decoder_pkg::*;

   logic [1:0]                 byte_offset;
   logic                       half_offset;
   assign byte_offset = core_addr_i[1:0];
   assign half_offset = core_addr_i[1];

   // byte enable logic
   always @ (*) begin
      case (core_size_i)
        LDST_W: mem_be_o = 4'b1111;
        LDST_H: mem_be_o = half_offset ? 4'b1100 : 4'b0011;
        LDST_B: mem_be_o = 4'b0001 << byte_offset;
        default: mem_be_o = 4'b0;
      endcase // case (core_size_i)
   end


endmodule // lsu
