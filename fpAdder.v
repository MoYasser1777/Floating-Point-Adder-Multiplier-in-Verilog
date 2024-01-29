module registeredFPA (
  input  clk,
  input  reset,
  input  enable,
  input [31:0] A,
  input [31:0] B,
  output reg [31:0] result,
  output reg overFlow
);

  reg [31:0] A_reg, B_reg;
  reg [31:0] Sum_reg;
  reg overFlow_reg;

  // Register inputs on positive edge of the clock
  always @(posedge clk) begin
    if (reset) begin
      A_reg <= 0;
      B_reg <= 0;
    end
    else if (enable) begin
      A_reg <= A;
      B_reg <= B;
    end
  end

  // Register outputs on positive edge of the clock
  always @(posedge clk) begin
    if (reset) begin
      result <= 0;
      overFlow <= 0;
    end
    if(enable) begin
      result <= Sum_reg;
      overFlow <= overFlow_reg;
    end
  end

  reg [24:0] MA, MB, MR;
  reg [7:0] ER;
  reg SR;
  reg IBA, IBB;
  integer MSB, i;

  always @(A_reg,B_reg) begin
    overFlow_reg = 0;
    IBA = (A_reg[30:23] == 8'b00000000) ? 1'b0 : 1'b1;
    IBB = (B_reg[30:23] == 8'b00000000) ? 1'b0 : 1'b1;
    MB = {IBB, B_reg[22:0]};
    MA = {IBA, A_reg[22:0]};
    if (A_reg[30:23] > B_reg[30:23]) begin
      MB = MB >> (A_reg[30:23] - B_reg[30:23]);
      ER = A_reg[30:23];
    end else begin
      MA = MA >> (B_reg[30:23] - A_reg[30:23]);
      ER = B_reg[30:23];
    end
    if (A_reg[31] == B_reg[31]) begin
      MR = MA + MB;
      SR = A_reg[31];
      if (MR[24]) begin
        MR = MR >> 1;
        ER = ER + 1;
        overFlow_reg = 1;
      end
    end else begin
      if (MA >= MB) begin
        MR = MA - MB;
      end else begin
        MR = MB - MA;
      end
      SR = (MA >= MB) ? A_reg[31] : B_reg[31];
      for (i = 0; i < 24; i = i + 1) begin
        if (MR[i] == 1) begin
          MSB = i;
        end
      end
      MR = MR << (23 - MSB);
      ER = ER - (23 - MSB);
    end

    if (ER == 8'b11111111) begin
      overFlow_reg = 1;
      MR[22:0] = 0;
    end
    Sum_reg = {SR, ER, MR[22:0]};
  end

endmodule
