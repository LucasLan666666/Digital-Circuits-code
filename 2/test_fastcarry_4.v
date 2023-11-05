module test_fastcarry_4();
    reg   [3:0] A;
    reg   [3:0] B;
    reg         Cin;
    wire  [3:0] S1;
    wire        Cout1;
    wire  [3:0] S2;
    wire        Cout2;
    wire        check = (   S1 === S2   ) 
                     && (Cout1 === Cout2);

    fastcarry_4 instance_fastcarry_4 (
        .A    (          A),
        .B    (          B),
        .Cin  (        Cin),
        .S    (         S1),
        .Cout (      Cout1)
    );

    TEMPLATE_fastcarry_4 instance_TEMPLATE_fastcarry_4 (
        .A    (          A),
        .B    (          B),
        .Cin  (        Cin),
        .S    (         S2),
        .Cout (      Cout2)
    );
    
    initial
    begin
          A = 4'd0;
          B = 4'd0;
        Cin = 1'b0;
    end

    always
    begin
        #2;
          A = $random() % 16;
          B = $random() % 16;
        Cin = $random() %  2;
    end
endmodule