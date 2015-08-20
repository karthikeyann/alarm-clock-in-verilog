module testbench;
  reg system_clk, reset;
  wire  [7:0] alarmsec, alarmmin, alarmhr;
  wire [7:0] seca, mina, hra,minm1,hrm1,minm2,hrm2,sec, min, hr; //a stands for asynchronous output
  wire [6:0] disp;
  wire sec_clk, tc_s, tc_m;
  wire [1:0]mode;
  wire [3:0]num;
  wire enablealarm, enabledisplay, setalarm, settime, trigger;
  wire [7:0]minset,hrset;
  wire alert;
  reg [7:0]alarmmin1,alarmhr1;
  // load control to counter60, 24
  // alarm function
  initial
  begin
    system_clk=1'b1;
    reset = 1'b1;
    #1
    reset = 1'b0;
    alarmmin1=8'h01;
    alarmhr1 =8'h00; 
  end
  always
     #10000 system_clk = ~system_clk;
  clockunit clockunit1( reset,  system_clk, sec_clk);
  counter60 seconds(reset, sec_clk, seca, tc_s);
  counter60 minutes(reset,tc_s, mina, tc_m);
  counter24 hour(reset, tc_m, hra, tc_h);
  mux2b16  mux1(settime,mina, hra, minset,hrset,minm1,hrm1);
  memory timekeeper(reset,sec_clk, seca, minm1, hrm1,sec, min, hr);
  displaydecoder dis(reset, sec[3:0] ,disp);
  controlunit controlio(reset,trigger,mode,num,enablealarm, enabledisplay, setalarm, settime,minset,hrset);
  memory alarmkeeper(reset,setalarm, 8'h0, minset, hrset,alarmsec, alarmmin, alarmhr);
  alarmunit alarm1(enablealarm,sec_clk, alarmmin1, alarmhr1,min,hr,alert);
endmodule;