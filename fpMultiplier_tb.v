module fpMultiplier_tb();

  reg clk, reset,enable;
  reg  [31:0] in1,in2;
  wire [31:0] out;
  wire overflow;
  integer count;
  
  singleModuleFPM dut (clk,reset,enable,in1,in2,out,overflow);

  always #10 clk = ~clk;
  
  initial begin
    clk   = 1'b1;
    enable = 1'b0;
    count = 0;

    reset = 1'b1;
    #40
    reset = 1'b0;

    in1 = 32'h40aa6666;
    in2 = 32'h40aa6666;
    #20;
    enable=1;
    #80;
	if(out === 32'h41e2d850 & overflow==0) begin
		$display("TestCase#1 Success");
		count = count + 1 ;
	end
	else $display("TestCase#1 failed with inputs= %h , %h and output= %h expected= %h", in1, in2, out, 32'h41e2d850);
    enable=0;

    in1 = 32'hc0080000;
    in2 = 32'hc0680000;
    #20;
    enable=1;
    #80;
	if(out === 32'h40f68000 & overflow==0) begin
		$display("TestCase#2 Success");
		count = count + 1 ;
	end
	else $display("TestCase#2 failed with inputs= %h , %h and output= %h expected= %h", in1, in2, out, 32'h40f68000);
    enable=0;

    in1 = 32'hbf200000;
    in2 = 32'h3fd00000;
    #20;
    enable=1;
    #80;
	if(out === 32'hbf820000 & overflow==0) begin
		$display("TestCase#3 Success");
		count = count + 1 ;
	end
	else $display("TestCase#3 failed with inputs= %h , %h and output= %h expected= %h", in1, in2, out, 32'hbf820000);
    enable=0;

    in1 = 32'h40a80000;
    in2 = 32'hc0440000;
    #20;
    enable=1;
    #80;
	if(out === 32'hc180a000 & overflow==0) begin
		$display("TestCase#4 Success");
		count = count + 1 ;
	end
	else $display("TestCase#4 failed with inputs= %h , %h and output= %h expected= %h", in1, in2, out, 32'hc180a000);
    enable=0;

    in1 = 32'h00000000;
    in2 = 32'h40a80000;
    #20;
    enable=1;
    #80;
	if(out === 32'h00000000 & overflow==0) begin
		$display("TestCase#5 Success");
		count = count + 1 ;
	end
	else $display("TestCase#5 failed with inputs= %h , %h and output= %h expected= %h", in1, in2, out, 32'h00000000);
    enable=0;

    in1 = 32'h00000000;
    in2 = 32'hc0480000;
    #20;
    enable=1;
    #80;
	if(out === 32'h00000000 & overflow==0) begin
		$display("TestCase#6 Success");
		count = count + 1 ;
	end
	else $display("TestCase#6 failed with inputs= %h , %h and output= %h expected= %h", in1, in2, out, 32'h00000000);
    enable=0;

    in1 = 32'h3f800000;
    in2 = 32'h40480000;
    #20;
    enable=1;
    #80;
	if(out === 32'h40480000 & overflow==0) begin
		$display("TestCase#7 Success");
		count = count + 1 ;
	end
	else $display("TestCase#7 failed with inputs= %h , %h and output= %h expected= %h", in1, in2, out, 32'h40480000);
    enable=0;

    in1 = 32'h3f800000;
    in2 = 32'hc0480000;
    #20;
    enable=1;
    #80;
	if(out === 32'hc0480000 & overflow==0) begin
		$display("TestCase#8 Success");
		count = count + 1 ;
	end
	else $display("TestCase#8 failed with inputs= %h , %h and output= %h expected= %h", in1, in2, out, 32'hc0480000);
    enable=0;

    in1 = 32'h00000000;
    in2 = 32'h00000000;
    #20;
    enable=1;
    #80;
	if(out === 32'h00000000 & overflow==0) begin
		$display("TestCase#9 Success");
		count = count + 1 ;
	end
	else $display("TestCase#9 failed with inputs= %h , %h and output= %h expected= %h", in1, in2, out, 32'h00000000);
    enable=0;

    in1 = 32'h7f000000;
    in2 = 32'h7f000000;
    #20;
    enable=1;
    #80;
	if(out === 32'h3e800000 & overflow==1) begin
		$display("TestCase#10 Success");
		count = count + 1 ;
	end
	else $display("TestCase#10 failed with inputs= %h , %h and output= %h expected= %h", in1, in2, out, 32'h3e800000);
    enable=0;

	$display("--------------------- %d   passed testcases out of 10   ---------------------", count);
	$display("--------------------- %d     failed testcases out of 10     ---------------------", 10-count);

  end

endmodule