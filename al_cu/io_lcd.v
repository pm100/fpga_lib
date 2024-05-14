
`include "../ice40/Binary_To_7Segment.v"
`include "../ice40/Demux_1_To_4.v"
`include "../ice40/counter.v"

`ifndef io_lcd_
`define io_lcd_ 1
module io_lcd (
    input clk,
    input rst,
    input [3:0] i_digit1,
    input i_show_digit1,
    input [3:0] i_digit2,
    input i_show_digit2,
    input [3:0] i_digit3,
    input i_show_digit3,
    input [3:0] i_digit4,
    input i_show_digit4,
    output [3:0] o_select,
    output [6:0] o_segment
);

  // select the digit to show
  // the counter cycles 0 to 3
  Demux_1_To_4 demux1 (
      .i_Data (1'b1),
      .i_Sel0 (w_anode_mux[0]),
      .i_Sel1 (w_anode_mux[1]),
      .o_Data0(w_sel[0]),
      .o_Data1(w_sel[1]),
      .o_Data2(w_sel[2]),
      .o_Data3(w_sel[3])
  );

  wire [3:0] w_sel;
  wire [1:0] w_anode_mux;
  assign o_select[0] = ~(w_sel[0] & i_show_digit1);
  assign o_select[1] = ~(w_sel[1] & i_show_digit2);
  assign o_select[2] = ~(w_sel[2] & i_show_digit3);
  assign o_select[3] = ~(w_sel[3] & i_show_digit4);

  wire [3:0] w_digits[3:0];
  assign w_digits[0] = i_digit1;
  assign w_digits[1] = i_digit2;
  assign w_digits[2] = i_digit3;
  assign w_digits[3] = i_digit4;

  Binary_To_7Segment seg1 (
      .i_Clk(clk),
      .i_Binary_Num(w_digits[w_anode_mux]),
      .o_Segment_A(o_segment[0]),
      .o_Segment_B(o_segment[1]),
      .o_Segment_C(o_segment[2]),
      .o_Segment_D(o_segment[3]),
      .o_Segment_E(o_segment[4]),
      .o_Segment_F(o_segment[5]),
      .o_Segment_G(o_segment[6])
  );

  counter #(
      .DIV (16),
      .SIZE(2)
  ) counter1 (
      .clk  (clk),
      .rst  (rst),
      .value(w_anode_mux)
  );

endmodule
`endif
