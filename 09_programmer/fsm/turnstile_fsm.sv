module turnstile_fsm(
                     input logic clk,
                     input logic rst,
                     input logic push,
                     input logic coin,
                     output logic is_locked
                     );

   enum logic {
               LOCKED=1,
               UNLOCKED=0
               } state;

   logic state_reg;

   assign is_locked = state_reg;

   always_ff @(posedge clk or posedge rst) begin
      if (rst) begin
         state_reg <= LOCKED;
      end
      else begin
         case (state_reg)
           LOCKED: begin
              if (push) begin
                 state_reg <= state_reg;
              end
              else if (coin) begin
                 state_reg <= UNLOCKED;
              end
           end
           UNLOCKED: begin
              if (push) begin
                 state_reg <= LOCKED;
              end
              else if (coin) begin
                 state_reg <= state_reg;
              end
           end
         endcase // case (state_reg)
      end
   end


endmodule // turnstile_fsm
