module fastcarry_4 (
    input  [ 3: 0] A,
    input  [ 3: 0] B,
    input          Cin,
    output [ 3: 0] S,
    output         Cout
);

    wire   [ 3: 0] C;
    wire   [ 3: 0] P;
    wire   [ 3: 0] G;

    PG_generator t0 (A[0], B[0], P[0], G[0]);
    PG_generator t1 (A[1], B[1], P[1], G[1]);
    PG_generator t2 (A[2], B[2], P[2], G[2]);
    PG_generator t3 (A[3], B[3], P[3], G[3]);

    assign  C[0] = Cin;
    assign  C[1] = G[0] 
                || P[0] && Cin;
    assign  C[2] = G[1] 
                || P[1] && G[0] 
                || P[1] && P[0] && Cin;
    assign  C[3] = G[2] 
                || P[2] && G[1] 
                || P[2] && P[1] && G[0] 
                || P[2] && P[1] && P[0] && Cin;
    assign  Cout = G[3] 
                || P[3] && G[2] 
                || P[3] && P[2] && G[1] 
                || P[3] && P[2] && P[1] && G[0] 
                || P[3] && P[2] && P[1] && P[0] && Cin;
    assign     S = P ^ C;
endmodule

module PG_generator (
    input          a,
    input          b,
    output         p,
    output         g
);

    assign  p = a ^ b;
    assign  g = a & b;

endmodule