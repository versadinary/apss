module led_sb_ctrl (
    input logic         clk_i,
    input logic         rst_i,
    input logic         req_i,
    input logic         write_enable_i,
    input logic [31:0]  addr_i,
    input logic [31:0]  write_data_i,
    output logic [31:0] read_data_o,
    output logic [15:0] led_o
);

    logic [15:0] led_val;
    logic led_mode;
    logic [23:0] counter;
    logic led_toggle;

    always_ff @ (posedge clk_i) begin
        if (reset) begin
            counter <= 24'd0;
        end
        else if (led_mode) begin
            counter <= counter + 1;
        end
        else begin
            counter <= 24'd0;
        end
    end

    always_ff @ (posedge clk_i) begin
        if (reset) begin
            led_toggle <= 1'b0;
        end
        else led_toggle <= counter == '1;
    end

    assign led_o = led_mode ? (led_toggle ? led_val : 'b0) : led_val;

    logic reset;
    assign reset = rst_i | req_i & write_enable_i & 
                    (addr_i[7:0] == 8'h24) & write_data_i[0];  

    always_ff @ (posedge clk_i) begin
        if (reset) begin
            led_val <= 16'd0;
        end
        else if (req_i & write_enable_i & (addr_i[7:0] == 8'h00)) begin
            led_val <= write_data_i[15:0];
        end
    end

    always_ff @ (posedge clk_i) begin
        if (reset) begin
            led_mode <= 1'b0;
        end
        else if (req_i & write_enable_i & (addr_i[7:0] == 8'h04)) begin
            led_mode <= write_data_i[0];
        end
    end

    always_ff @ (posedge clk_i) begin
        if (req_i & ~write_enable_i) begin
            case (addr_i[7:0])
                8'h00: read_data_o <= {16'd0, led_val};
                8'h04: read_data_o <= {31'd0, led_mode};
                default: read_data_o <= read_data_o;
            endcase
        end
    end

endmodule