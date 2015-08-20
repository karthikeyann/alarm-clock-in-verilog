module mux2b16(s,minm1,hrm1,minm2,hrm2,min_out,hr_out);
  input [7:0]minm1,hrm1,minm2,hrm2;
  output [7:0] min_out,hr_out;
  input s;
  assign {min_out, hr_out}= (s==0)?{minm1,hrm1}:{minm2,hrm2};
endmodule
