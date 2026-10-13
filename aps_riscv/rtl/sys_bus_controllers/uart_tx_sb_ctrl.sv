module uart_tx_sb_ctrl
  (
   input logic         clk_i,
   input logic         rst_i,
   input logic [31:0]  addr_i,
   input logic         req_i,
   input logic [31:0]  write_data_i,
   input logic         write_enable_i,
   output logic [31:0] read_data_o,

   output logic        tx_o,
   output logic        ready_o
   );

   logic busy;
   logic [16:0] baudrate;
   logic        parity_en;
   logic [1:0]  stopbit;
   logic [7:0]  data;

   assign ready_o = 1'b1;

   logic        soft_reset;
   assign soft_reset = req_i & write_enable_i & (addr_i[7:0] == 8'h24) & (write_data_i == 32'b1);

   logic busy_tx;
   always_ff @ (posedge clk_i) begin
      if (rst_i | soft_reset) busy <= 1'b0;
      else busy <= busy_tx;
   end

   always_ff @ (posedge clk_i) begin
      if (rst_i | soft_reset) baudrate <= 17'd9600;
      else if (req_i & (addr_i[7:0] == 8'h0C) & write_enable_i & ~busy_tx)
        baudrate <= write_data_i;
   end

   always_ff @ (posedge clk_i) begin
      if (rst_i | soft_reset) parity_en <= 1'd0;
      else if (req_i & (addr_i[7:0] == 8'h10) & write_enable_i & ~busy_tx)
        parity_en <= write_data_i;
   end

   always_ff @ (posedge clk_i) begin
      if (rst_i | soft_reset) stopbit <= 2'd1;
      else if (req_i & (addr_i[7:0] == 8'h14) & write_enable_i & ~busy_tx)
        stopbit <= write_data_i;
   end

   always_ff @ (posedge clk_i) begin
      if (rst_i | soft_reset) data <= 8'd0;
      else if (req_i & (addr_i[7:0] == 8'h00) & write_enable_i & ~busy_tx)
        data <= write_data_i;
   end

   uart_tx tx
     (
      .clk_i(clk_i),
      .rst_i(soft_reset | rst_i),
      .tx_o(tx_o),
      .busy_o(busy_tx),
      .baudrate_i(baudrate),
      .parity_en_i(parity_en),
      .stopbit_i(stopbit),
      .tx_data_i(write_data_i[7:0]),
      .tx_valid_i(req_i & write_enable_i & (addr_i[7:0] == 16'h00) & ~busy)
      );

   always_ff @ (posedge clk_i) begin
      if (rst_i | soft_reset) read_data_o <= 32'd0;
      else if (req_i & ~write_enable_i) begin
         case (addr_i)
           32'h00: read_data_o <= {24'd0, data};
           32'h08: read_data_o <= {31'd0, busy};
           32'h0C: read_data_o <= {15'd0, baudrate};
           32'h10: read_data_o <= {31'd0, parity_en};
           32'h14: read_data_o <= {30'd0, stopbit};
           default: read_data_o <= read_data_o;
         endcase
      end
   end


endmodule
