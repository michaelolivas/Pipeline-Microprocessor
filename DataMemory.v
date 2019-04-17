module DataMemory #(parameter xw = 32, dw = 32)
(input signed [xw - 1:0] x, 
    input WE, clk, 
        input signed [dw - 1:0] dataIn,
        output reg signed [xw - 1:0] data);
        
    reg [dw - 1:0] mem [127:0];
    //reg [xw - 1:0] d;
    
    initial begin 
        $readmemb("dataMem.mem", mem);
    end
    //read data asynch
    always@* begin
        data = mem[x];
    end
    //return data
    //assign data = d;
    //write data synchronous
    always @(posedge clk or posedge WE) begin
        if (WE)
            mem[x] = dataIn;
    end
    
endmodule