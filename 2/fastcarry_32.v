module fastcarry_32 (
    input  [31: 0] A,
    input  [31: 0] B,
    input          Cin,
    output [31: 0] S,
    output         Cout
);

    wire   [31: 0] P0;
    wire   [31: 0] G0;
    wire   [31: 0] C0;
    wire   [ 7: 0] P1;
    wire   [ 7: 0] G1;
    wire   [ 7: 0] C1;
    wire   [ 3: 0] P2;
    wire   [ 3: 0] G2;
    wire   [ 3: 0] C2;
    
    assign    P0 =  A ^ B;
    assign    G0 =  A & B;
    assign     S = P0 ^ C0;
    assign  Cout = C2[2];

    fastcarry_4_2  f00 (
        .Pin  ( P0 [ 3: 0]), 
        .Gin  ( G0 [ 3: 0]), 
        .Cin  (Cin        ), 
        .C    ( C0 [ 3: 0]), 
        .Pout ( P1 [    0]), 
        .Gout ( G1 [    0])
    );
    fastcarry_4_2  f01 (
        .Pin  ( P0 [ 7: 4]), 
        .Gin  ( G0 [ 7: 4]), 
        .Cin  ( C1 [    1]), 
        .C    ( C0 [ 7: 4]), 
        .Pout ( P1 [    1]), 
        .Gout ( G1 [    1])
    );
    fastcarry_4_2  f02 (
        .Pin  ( P0 [11: 8]), 
        .Gin  ( G0 [11: 8]), 
        .Cin  ( C1 [    2]), 
        .C    ( C0 [11: 8]), 
        .Pout ( P1 [    2]), 
        .Gout ( G1 [    2])
    );
    fastcarry_4_2  f03 (
        .Pin  ( P0 [15:12]), 
        .Gin  ( G0 [15:12]), 
        .Cin  ( C1 [    3]), 
        .C    ( C0 [15:12]), 
        .Pout ( P1 [    3]), 
        .Gout ( G1 [    3])
    );
    fastcarry_4_2  f04 (
        .Pin  ( P0 [19:16]), 
        .Gin  ( G0 [19:16]), 
        .Cin  ( C2 [    1]), 
        .C    ( C0 [19:16]), 
        .Pout ( P1 [    4]), 
        .Gout ( G1 [    4])
    );
    fastcarry_4_2  f05 (
        .Pin  ( P0 [23:20]), 
        .Gin  ( G0 [23:20]), 
        .Cin  ( C1 [    5]), 
        .C    ( C0 [23:20]), 
        .Pout ( P1 [    5]), 
        .Gout ( G1 [    5])
    );
    fastcarry_4_2  f06 (
        .Pin  ( P0 [27:24]), 
        .Gin  ( G0 [27:24]), 
        .Cin  ( C1 [    6]), 
        .C    ( C0 [27:24]), 
        .Pout ( P1 [    6]), 
        .Gout ( G1 [    6])
    );
    fastcarry_4_2  f07 (
        .Pin  ( P0 [31:28]), 
        .Gin  ( G0 [31:28]), 
        .Cin  ( C1 [    7]), 
        .C    ( C0 [31:28]),
        .Pout ( P1 [    7]),
        .Gout ( G1 [    7])
    );
    fastcarry_4_2  f10 (
        .Pin  ( P1 [ 3: 0]), 
        .Gin  ( G1 [ 3: 0]), 
        .Cin  (Cin        ),
        .C    ( C1 [ 3: 0]),
        .Pout ( P2 [    0]), 
        .Gout ( G2 [    0])
    );
    fastcarry_4_2  f11 (
        .Pin  ( P1 [ 7: 4]), 
        .Gin  ( G1 [ 7: 4]), 
        .Cin  ( C2 [    1]),
        .C    ( C1 [ 7: 4])
    );
    fastcarry_4_2  f20 (
        .Pin  ( P2 [ 3: 0]), 
        .Gin  ( G2 [ 3: 0]), 
        .Cin  (Cin        ),
        .C    ( C2 [ 3: 0])
    );
endmodule

module fastcarry_4_2 (  
    input  [ 3: 0] Pin,
    input  [ 3: 0] Gin,
    input          Cin,
    output [ 3: 0] C,
    output         Pout,
    output         Gout
);

    assign  C[0] = Cin;
    assign  C[1] = Gin[0] 
                || Pin[0] && Cin;
    assign  C[2] = Gin[1] 
                || Pin[1] && Gin[0] 
                || Pin[1] && Pin[0] && Cin;
    assign  C[3] = Gin[2] 
                || Pin[2] && Gin[1] 
                || Pin[2] && Pin[1] && Gin[0] 
                || Pin[2] && Pin[1] && Pin[0] && Cin;
    assign  Gout = Gin[3] 
                || Pin[3] && Gin[2] 
                || Pin[3] && Pin[2] && Gin[1] 
                || Pin[3] && Pin[2] && Pin[1] && Gin[0];
    assign  Pout = Pin[3] && Pin[2] && Pin[1] && Pin[0];
endmodule