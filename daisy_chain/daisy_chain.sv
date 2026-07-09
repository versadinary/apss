module daisy_chain (
                    input logic         clk_i,
                    input logic         rst_i,
                    input logic [15:0]  masked_irq_i,
                    input logic         irq_ret_i,
                    input logic         ready_i,
                    output logic        irq_o,
                    output logic [31:0] irq_cause_o,
                    output logic [13:0] irq_ret_o
                    );

   logic [15:0]                         cause;
   logic [15:0]                         ready;
   assign ready[0] = ready_i;
   assign cause = masked_irq_i & ready;

   genvar                               i;
   generate
      for (i = 1; i < 16; i++) begin : gen_ready
         assign ready[i] = ready[i - 1] & cause[i];
      end
   endgenerate

   assign irq_o = |cause;
   assign irq_cause_o = {12'h800, cause, 4'h0};

   logic [15:0] cause_ff;

   always_ff @(posedge clk_i or posedge rst_i) begin
      if (rst_i) begin
         cause_ff <= 'd0;
      end
      else if (irq_o) begin
         cause_ff <= cause_ff;
      end
      else begin
         cause_ff <= cause;
      end
   end // always_ff @ (posedge clk_i or posedge rst_i)

   assign irq_ret_o = irq_ret_i ? cause_ff : 16'd0;


endmodule  // daisy_chain
