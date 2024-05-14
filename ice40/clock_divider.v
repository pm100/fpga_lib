module clock_divider #(parameter DIVIDER(4))(

 input clk, 
 output  clk_out);
   reg [12:0] count;
   
   always @(posedge clk)
      if (count >= DIVIDER) begin
         clk_out <= ~clk_out;
         count = 0;
      end
     
      count <= count + 1;
     
endmodule