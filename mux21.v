module mux21 #(parameter WL = 1)
                (input sel, 
                  input signed [WL-1:0] a, b,
                  output signed [WL - 1:0] out);
    assign out = sel ? a : b;

endmodule