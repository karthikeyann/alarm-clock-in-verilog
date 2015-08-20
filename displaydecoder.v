module displaydecoder(reset, bcd_in, disp_out);
  input reset;
  input [3:0]bcd_in;
  output reg [6:0]disp_out; //abcd efg
  always @(posedge reset, bcd_in)
  /*****************
  --a--
 f|    |b
  --g--
 e|    |c
  --d--
  *****************/
  begin
    if(reset==1)
      disp_out = 7'b0000001;
    else
      case(bcd_in)
        4'd0: disp_out = 7'b1111110;
        4'd1: disp_out = 7'b0110000;
        4'd2: disp_out = 7'b1101101;
        4'd3: disp_out = 7'b1111001;
        4'd4: disp_out = 7'b0110011;
        4'd5: disp_out = 7'b1011011;
        4'd6: disp_out = 7'b1011111;
        4'd7: disp_out = 7'b1110000;
        4'd8: disp_out = 7'b1111111;
        4'd9: disp_out = 7'b1111011;
        default: disp_out = 7'b0000001;
      endcase
    end
  endmodule