module fir(fout,fin,clk);
input [5:0]fin;
input clk;
output reg[31:0] fout;
reg[15:0] b[0:2];
reg [15:0] shift[0:2];
initial
  begin
  b[0]<=16'd1;
  b[1]<=16'd1;
  b[2]<=16'd1;
  end
always@(posedge clk)
  begin
shift[0]<=fin;
shift[1]<=shift[0];
shift[2]<=shift[1];
  end    
always@(posedge clk)
  begin
fout<= ((shift[0]*b[0])+(shift[1]*b[1])+(shift[2]*b[2]));
  end
endmodule
