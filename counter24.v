module counter24(reset, clkin, count, tc);
  input reset, clkin;
  output reg [7:0]count;
  output reg tc;
  always @( posedge reset , posedge clkin)
  begin
    if(reset == 1)
      begin
      count<=8'h0;
      tc <= 1'b0;
      end
    else 
      begin
    if(count == 8'h23)
      begin
      count <= 8'h0;
      tc <= 1'b1;
      end
    else
      begin
        count[3:0] = count[3:0] + 1'b1;
        tc <= 1'b0;
      if(count[3:0] == 4'd10)
          begin
          count[3:0] <= 4'd0;
          count[7:4] <= count[7:4] + 4'h1;
        end
    end
    end
  end
  endmodule;
