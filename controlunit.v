module controlunit(reset, clk, mode, num, enablealarm, enabledisplay, setalarm, settime,min_out,hr_out);
  input reset,clk;
  input [3:0]num;
  input [1:0]mode;
  reg [7:0]min,hr;
  output reg enablealarm,enabledisplay,setalarm,settime;
  output reg [7:0]min_out,hr_out;
  reg [2:0]currstate,nextstate;
  parameter IDLE=3'd0,GOT1=3'd1,GOT2=3'd2,GOT3=3'd3,GOT4=3'd4;
  parameter DISP=2'd0,SETT=2'd1,SETA=2'd2,DISA=2'd3;
  always@(posedge reset or posedge clk )
  begin
    if(reset)
      begin
        enablealarm=1;
        enabledisplay=1;
      currstate<=IDLE;
      nextstate<=IDLE;
      settime<=0;
      setalarm<=0;
      min_out<=8'h0;
      hr_out<=8'h0;
    end
    else
      currstate<=nextstate;
  end
  always@(posedge clk)
  begin
//    nextstate=currstate;
//    settime<=0;
//    setalarm<=0;
    case(mode)
      DISP:
      begin
        enabledisplay<=1;
        nextstate<=IDLE;
        settime<=0;
        setalarm<=0;
        end
//        ---------------------------
      SETT:
      begin
      case(nextstate)
        IDLE:
        begin
          enabledisplay<=0;
          nextstate<=GOT1;
          settime<=0;
          setalarm<=0;
          end
        GOT1:
        begin
          enabledisplay<=0;
          hr[7:4]<=num[3:0];
          nextstate<=GOT2;
          end
        GOT2:
        begin
          enabledisplay<=0;
          hr[3:0]<=num[3:0];
          nextstate<=GOT3;
          end
        GOT3:
        begin
          enabledisplay<=0;
          min[7:4]<=num[3:0];
          nextstate<=GOT4;
          end
        GOT4:
        begin
          min[3:0]=num[3:0];
          settime<=1;
          min_out<=min;
          hr_out <=hr;
          nextstate<=IDLE;
          enabledisplay<=1;
          end
      endcase
      end
      //-----------------------------------
      SETA:
            begin
      case(nextstate)
        IDLE:
        begin
          enabledisplay<=0;
          nextstate<=GOT1;
          settime<=0;
          setalarm<=0;
          end
        GOT1:
        begin
          enabledisplay<=0;
          hr[7:4]<=num[3:0];
          nextstate<=GOT2;
          end
        GOT2:
        begin
          enabledisplay<=0;
          hr[3:0]<=num[3:0];
          nextstate<=GOT3;
          end
        GOT3:
        begin
          enabledisplay<=0;
          min[7:4]<=num[3:0];
          nextstate<=GOT4;
          end
        GOT4:
        begin
          enabledisplay<=1;
          min[3:0]=num[3:0];
          setalarm<=1;
          min_out<=min;
          hr_out <=hr;
          nextstate<=IDLE;
          end
      endcase
      end
      //---------------------------------------
      DISA:
      begin
        enablealarm<=0;
        nextstate<=IDLE;
        end
    endcase  
    end 
endmodule
