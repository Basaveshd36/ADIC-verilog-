module seq_detector(
    input x, clk, reset,
    output reg z
);

reg [1:0] ps, ns;
parameter s0=0, s1=1, s2=2, s3=3;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        ps <= s0;
        ns <= s0;
    end
    else begin
        ps <= ns;
        case(ps)
            s0: begin
                z = (x == 0);
                ns = (x == 1) ? s1 : s0;
            end
            s1: begin
                z = (x == 0);
                ns = (x == 1) ? s2 : s1;
            end
            s2: begin
                z = (x == 0);
                ns = (x == 1) ? s3 : s1;
            end
            s3: begin
                z = (x == 0);
                ns = (x == 1) ? s0 : s1;
            end
        endcase
    end
end

endmodule
