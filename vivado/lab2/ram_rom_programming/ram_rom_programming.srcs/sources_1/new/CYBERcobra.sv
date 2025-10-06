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
   logic [31:0]                        pc_incr;
   logic [31:0]                        PC_o;


   assign out_o = rf_read_data1;
   
   fulladder32 pc_adder(
                        .a_i(PC),
                        .b_i(pc_incr),
                        .carry_i(1'd0),
                        .sum_o(PC_o)
                        );

   instr_mem imem(
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
   always @ (posedge clk_i or posedge rst_i) begin
      if (rst_i) begin
         PC <= 32'd0;
         // pc_incr <= 32'd0;
      end
      else begin
         PC <= PC_o;
      end
   end

   assign pc_incr = (instr_bus[31] | instr_bus[30] & alu_flag) ?
                    {{22{instr_bus[12]}}, {instr_bus[12:5], 2'b0}}
                    : 32'd4;

   /*
   always @ (posedge clk_i) begin
      if (instr_bus[31] | instr_bus[30] & alu_flag) begin
         pc_incr <= {{22{last_dig_off}}, {instr_bus[12:5], 2'b00}};
      end
      else begin
         pc_incr <= 32'd4;
      end
   end
    */
   /*
   always @ (posedge clk_i or posedge rst_i) begin
      if (rst_i) begin
         PC <= 32'd0;
         pc_incr <= 32'd0;
      end
      else begin
         if (instr_bus[31] | instr_bus[30] & alu_flag) begin
            pc_incr <= {{22{instr_bus[12]}}, {instr_bus[12:5], 2'b00}};
            PC <= PC_o;
         end
         else begin
            pc_incr <= 32'd4;
            PC <= PC_o;
         end
      end
   end
   */

   // write select logic
   always @ (clk_i) begin
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
