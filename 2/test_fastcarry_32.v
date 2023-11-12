module test_fastcarry_32();
    reg   [31:0] A;
    reg   [31:0] B;
    reg          Cin;
    wire  [31:0] S1;
    wire         Cout1;
    wire  [31:0] S2;
    wire         Cout2;
    wire         check = (   S1 === S2   ) 
                      && (Cout1 === Cout2);

    fastcarry_32 instance_fastcarry_32 (
        .A    (          A),
        .B    (          B),
        .Cin  (        Cin),
        .S    (         S1),
        .Cout (      Cout1)
    );

    TEMPLATE_fastcarry_32 instance_TEMPLATE_fastcarry_32 (
        .A    (          A),
        .B    (          B),
        .Cin  (        Cin),
        .S    (         S2),
        .Cout (      Cout2)
    );

    initial
    begin
          A = 32'h0;
          B = 32'h0;
        Cin =  1'b0;
    end

    always
    begin
        #2;
          A = $random() % 2^32;
          B = $random() % 2^32;
        Cin = $random() %    2;
    end
endmodule