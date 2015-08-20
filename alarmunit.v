module alarmunit(en,clk,almin,alhr,min,hr,assert);
  input en, clk;
  input [7:0] almin,alhr,min,hr;
//  input [1:0]mode;
  output reg assert;
  always@(posedge clk)
  begin
    if(en==0)
      assert<=1'b0;
    else  if(almin==min && alhr ==alhr)
          assert <= 1;
      else
        assert <=0;
  end
endmodule;
