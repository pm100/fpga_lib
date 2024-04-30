`ifndef counter_
`define counter_ 1

// Counts up or down depending on UP
// Clock is divided by 2^DIV
// counter counts at the divided rate

module counter #(
    parameter SIZE = 8,
    parameter DIV  = 0,
    parameter TOP  = 0,

    // direction to count, use 1 for up and 0 for down
    parameter UP = 1
) (
    input clk,
    input rst,
    output [SIZE-1:0] value,
    output reg o_change
);

  reg [SIZE+DIV-1:0] counter = 0;
  reg [SIZE-1:0] r_old_value = 0;
  assign value = counter[SIZE+DIV-1:DIV];

  localparam MAX_VALUE = {{TOP{1'b1}}, {DIV{1'b1}}};  // value when maxed out

  always @(posedge clk) begin
    // set the output
    if (r_old_value != value) begin
      o_change <= 1;
      r_old_value <= value;
    end else begin
      o_change <= 0;
    end
    if (UP) begin  // when this is an up counter
      counter <= counter + 1;  // increase

      if (TOP != 0 && counter == MAX_VALUE) begin  // reached the top?
        counter <= 0;  // reset
      end
    end else begin  // down counter
      counter <= counter - 1;  // increase
      if (TOP != 0 && counter == 0) begin  // reached the bottom?
        counter <= MAX_VALUE;  // reset to top
      end
    end
  end
endmodule
`endif
