module TEMPLATE_fastcarry_32 (A, B, Cin, S, Cout);
    input  [31: 0] A;
    input  [31: 0] B;
    input          Cin;
    output [31: 0] S;
    output         Cout;

    assign {Cout, S} = A + B + Cin;
endmodule