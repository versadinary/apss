module register_file(
                     input logic         clk_i,
                     input logic         write_enable_i,

                     input logic [4:0]   write_addr_i,
                     input logic [4:0]   read_addr1_i,
                     input logic [4:0]   read_addr2_i,

                     input logic [31:0]  write_data_i,
                     output logic [31:0] read_data1_o,
                     output logic [31:0] read_data2_o
                     );


   logic [31:0]                          rf_mem [32];


   always @ (posedge clk_i) begin
      if (write_enable_i)
        rf_mem[write_addr_i] <= write_data_i;
      else
        rf_mem[write_addr_i] <= rf_mem[write_addr_i];
   end

   always @ (read_addr1_i or read_addr2_i) begin
      if (read_addr1_i)
         read_data1_o <= rf_mem[read_addr1_i];
      else
        read_data1_o <= 32'd0;
      if (read_addr2_i)
         read_data2_o <= rf_mem[read_addr2_i];
      else
        read_data2_o <= 32'd0;
   end


endmodule // register_file
