`timescale 1ns / 1ps

module top(
    input clk,
    input reset,
    input start,
    input [7:0] a,
    input [7:0] b,
    output [6:0] seg,
    output [7:0] an
);

wire [15:0] product;
wire sign;
wire [3:0] ten_thousands, thousands, hundreds, tens, ones;

signed_multiplier mult (
    .clk(clk),
    .reset(reset),
    .start(start),
    .a(a),
    .b(b),
    .product(product)
);

binary_to_bcd bcd_conv (
    .bin(product),
    .sign(sign),
    .ten_thousands(ten_thousands),
    .thousands(thousands),
    .hundreds(hundreds),
    .tens(tens),
    .ones(ones)
);

seven_segment display (
    .clk(clk),
    .reset(reset),
    .sign(sign),
    .ten_thousands(ten_thousands),
    .thousands(thousands),
    .hundreds(hundreds),
    .tens(tens),
    .ones(ones),
    .seg(seg),
    .an(an)
);

endmodule

module signed_multiplier(
    input clk,
    input reset,
    input start,
    input signed [7:0] a,
    input signed [7:0] b,
    output reg signed [15:0] product
);

reg [1:0] state;
localparam IDLE = 2'b00;
localparam CALC = 2'b01;
localparam DONE = 2'b10;

reg [15:0] product_reg;
reg [7:0] counter;
reg result_sign;
reg [7:0] a_abs, b_abs;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        state <= IDLE;
        product <= 16'b0;
        product_reg <= 16'b0;
        counter <= 8'b0;
        result_sign <= 1'b0;
    end else case(state)
        IDLE: if (start) begin
            result_sign <= a[7] ^ b[7];
            a_abs <= a[7] ? -a : a;
            b_abs <= b[7] ? -b : b;
            product_reg <= 0;
            counter <= b_abs;
            state <= CALC;
        end
        CALC: if (counter) begin
            product_reg <= product_reg + a_abs;
            counter <= counter - 1;
        end else state <= DONE;
        DONE: begin
            product <= result_sign ? -product_reg : product_reg;
            state <= IDLE;
        end
    endcase
end

endmodule

module binary_to_bcd(
    input signed [15:0] bin,
    output reg sign,
    output reg [3:0] ten_thousands,
    output reg [3:0] thousands,
    output reg [3:0] hundreds,
    output reg [3:0] tens,
    output reg [3:0] ones
);

reg [35:0] shift_reg;
integer i;

always @(*) begin
    sign = bin[15];
    shift_reg = {20'd0, sign ? -bin : bin};
    
    for (i = 0; i < 16; i = i+1) begin
        if (shift_reg[19:16] >= 5) shift_reg[19:16] = shift_reg[19:16] +3;
        if (shift_reg[23:20] >= 5) shift_reg[23:20] = shift_reg[23:20] +3;
        if (shift_reg[27:24] >= 5) shift_reg[27:24] = shift_reg[27:24] + 3;
        if (shift_reg[31:28] >= 5) shift_reg[31:28] = shift_reg[31:28] + 3;
        if (shift_reg[35:32] >= 5) shift_reg[35:32] = shift_reg[35:32] + 3;
        shift_reg = shift_reg << 1;
    end
    
    ten_thousands = shift_reg[35:32];
    thousands = shift_reg[31:28];
    hundreds = shift_reg[27:24];
    tens = shift_reg[23:20];
    ones = shift_reg[19:16];
end

endmodule

module seven_segment(
    input clk,
    input reset,
    input sign,
    input [3:0] ten_thousands,
    input [3:0] thousands,
    input [3:0] hundreds,
    input [3:0] tens,
    input [3:0] ones,
    output reg [6:0] seg,
    output reg [7:0] an
);

reg [14:0] counter;
reg [2:0] sel;

always @(posedge clk or posedge reset) begin
    if (reset) counter <= 0;
    else counter <= counter + 1;
end

always @(posedge clk) begin
    if (reset) sel <= 0;
    else if (&counter) sel <= (sel == 3'd5) ? 0 : sel + 1;
end

always @(*) begin
    an = 8'b11111111;
    case(sel)
        3'd0: begin // Sign
            an = 8'b11111110;
            seg = sign ? 7'b0111111 : 7'b1111111;
        end
        3'd1: begin // Ten thousands
            an = 8'b11111101;
            seg = get_segment(ten_thousands);
        end
        3'd2: begin // Thousands
            an = 8'b11111011;
            seg = get_segment(thousands);
        end
        3'd3: begin // Hundreds
            an = 8'b11110111;
            seg = get_segment(hundreds);
        end
        3'd4: begin // Tens
            an = 8'b11101111;
            seg = get_segment(tens);
        end
        3'd5: begin // Ones
            an = 8'b11011111;
            seg = get_segment(ones);
        end
    endcase
end

function [6:0] get_segment(input [3:0] num);
    case(num)
        4'd0: get_segment = 7'b1000000;
        4'd1: get_segment = 7'b1111001;
        4'd2: get_segment = 7'b0100100;
        4'd3: get_segment = 7'b0110000;
        4'd4: get_segment = 7'b0011001;
        4'd5: get_segment = 7'b0010010;
        4'd6: get_segment = 7'b0000010;
        4'd7: get_segment = 7'b1111000;
        4'd8: get_segment = 7'b0000000;
        4'd9: get_segment = 7'b0010000;
        default: get_segment = 7'b1111111;
    endcase
endfunction

endmodule