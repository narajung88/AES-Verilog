// verilog_format: off
//
// Instantiate multiple parallel encryptors and decryptors.
//

module AES_Mult_Encrypt#(parameter N=8)(in, key, out);
input [127:0][N-1:0] in;
input [127:0] key;
output [127:0][N-1:0] out;

genvar i;
generate
    for (i = 0; i < N-1; i = i + 1) begin
        AES_Encrypt #(.N(128)) inst ( .in(in[127:0][i]), .key(key), .out(out[127:0][i]));
    end
endgenerate

endmodule
