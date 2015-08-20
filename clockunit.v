
module clockunit(reset,clkin, clkout);
  input reset,clkin;
  output reg clkout;
  reg [25:0]cnt;
always @(posedge clkin , posedge reset)
  begin
    if(reset==1)
      begin
      cnt = 26'd0;
      clkout = 1'b1;
      end
    else
      cnt = cnt + 1'b1 ;
    if(cnt == 26'd2500)
      begin
      clkout = ~clkout;
      cnt = 26'd0;
    end
  end
endmodule