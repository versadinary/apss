module turnstile_fsm_v2(
                     input logic  clk,
                     input logic  rst,
                     input logic  push,
                     input logic  coin,
                     output logic is_locked,
                     output logic green_light
                     );

   enum logic {
               LOCKED=1,
               UNLOCKED=0
               } state;

   logic state_reg;

   assign is_locked = state;
   assign green_light = (state == UNLOCKED) && coin && (!push);


   always_ff @(posedge clk or posedge rst) begin
      if (rst) begin
         state <= LOCKED;
      end
      else begin
         case (state)
           LOCKED: begin
              if (push) begin
                 state <= state;
              end
              else if (coin) begin
                 state <= UNLOCKED;
              end
           end
           UNLOCKED: begin
              if (push) begin
                 state <= LOCKED;
              end
              else if (coin) begin
                 state <= state;
              end
           end
         endcase // case (state_reg)
      end
   end


endmodule // turnstile_fsm
