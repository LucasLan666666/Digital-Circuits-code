module TEMPLATE_fastcarry_4 (A, B, Cin, S, Cout);
    input  [ 3: 0] A;
    input  [ 3: 0] B;
    input          Cin;
    output [ 3: 0] S;
    output         Cout;

    assign {Cout, S} = A + B + Cin;

endmodule