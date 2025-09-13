module CYBERcobra (
                   input logic         clk_i,
                   input logic         rst_i,
                   input logic [15:0]  sw_i,
                   output logic [31:0] out_o
                   );

   logic [31:0]                        PC;
   logic [31:0]                        instr_bus;
   logic [31:0]                        rf_write_data;
   logic [31:0]                        rf_read_data1;
   logic [31:0]                        rf_read_data2;
   logic                               alu_flag;
   logic [31:0]                        alu_result;

   assign out_o = rf_read_data1;

   instr_mem im_main(
                     .read_addr_i(PC),
                     .read_data_o(instr_bus)
                     );

   register_file rf_main(
                         .clk_i(clk_i),
                         .write_enable_i(~(instr_bus[31] | instr_bus[30])),
                         .write_addr_i(instr_bus[4:0]),
                         .read_addr1_i(instr_bus[22:18]),
                         .read_addr2_i(instr_bus[17:13]),
                         .write_data_i(rf_write_data),
                         .read_data1_o(rf_read_data1),
                         .read_data2_o(rf_read_data2)
                         );

   
   alu alu_main(
                .a_i(rf_read_data1),
                .b_i(rf_read_data2),
                .alu_op_i(instr_bus[27:23]),
                .flag_o(alu_flag),
                .result_o(alu_result)
                );

   // pc logic
   always @ (posedge clk_i or rst_i) begin
      if (rst_i)
        PC <= 32'd0;
      else begin
         if (instr_bus[31] | instr_bus[30] & alu_flag)
           PC <= PC + {instr_bus[12:5], 2'b00};
         else
           PC <= PC + 32'd4;
      end
   end

   // write select logic
   always @ (posedge clk_i) begin
      case (instr_bus[29:28])
        2'd0:
          rf_write_data <= {{9{instr_bus[27]}}, instr_bus[27:5]};
        2'd1:
          rf_write_data <= alu_result;
        2'd2:
          rf_write_data <= {{16{sw_i[15]}}, sw_i};
        2'd3:
          rf_write_data <= 32'd0;
      endcase
   end

endmodule

