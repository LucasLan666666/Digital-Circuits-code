module comparator_4 (
    input  [ 3: 0] A,
    input  [ 3: 0] B,
    input          in_A_G_B,
    input          in_A_E_B,
    input          in_A_L_B,
    output         out_A_G_B,
    output         out_A_E_B,
    output         out_A_L_B
);

    assign out_A_G_B = (  A[3] && ~B[3])
                    || (( A[3] ==  B[3]) && ( A[2] && ~B[2]))
                    || (( A[3] ==  B[3]) && ( A[2] ==  B[2]) && ( A[1] && ~B[1]))
                    || (( A[3] ==  B[3]) && ( A[2] ==  B[2]) && ( A[1] ==  B[1]) && ( A[0] && ~B[0]))
                    || (( A[3] ==  B[3]) && ( A[2] ==  B[2]) && ( A[1] ==  B[1]) && ( A[0] ==  B[0]) && in_A_G_B); 
    assign out_A_L_B = ( ~A[3] &&  B[3])
                    || (( A[3] ==  B[3]) && (~A[2] &&  B[2]))
                    || (( A[3] ==  B[3]) && ( A[2] ==  B[2]) && (~A[1] &&  B[1]))
                    || (( A[3] ==  B[3]) && ( A[2] ==  B[2]) && ( A[1] ==  B[1]) && (~A[0] &&  B[0]))
                    || (( A[3] ==  B[3]) && ( A[2] ==  B[2]) && ( A[1] ==  B[1]) && ( A[0] ==  B[0]) && in_A_G_B); 
    assign out_A_E_B = (  A[3] ==  B[3]) && ( A[2] ==  B[2]) && ( A[1] ==  B[1]) && ( A[0] ==  B[0]) && in_A_E_B;
endmodule