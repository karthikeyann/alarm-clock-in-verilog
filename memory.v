module memory(reset, clk, sec_in ,min_in, hour_in, sec_out, min_out , hour_out);
  input reset, clk;
  input [7:0] sec_in ,min_in;
  input [7:0] hour_in;
  output reg [7:0] sec_out ,min_out;
  output reg [7:0] hour_out;
  always @(posedge clk or reset)//sec_in, min_in, hour_in)
  begin
    if(reset==1)
      begin
      sec_out <= 8'h0;
      min_out <= 8'h0;
      hour_out<= 8'h0;
    end
    else
      begin
      sec_out <= sec_in;
      min_out <= min_in;
      hour_out<=hour_in;
    end
    end
endmodule;