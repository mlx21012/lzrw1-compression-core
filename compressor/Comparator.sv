module Comparator(
input [15:0] [7:0] CurBytes,BytesAtOffset, // from input history
input ControlBit, reset, 		// ControlBit from table
output [3:0] Length);

int count;

always_comb begin

	if (reset) begin
		Length = 0;
		count = 0;
	end
	else if (ControlBit) begin
		count = 0;
		for (int i = 0; i < 16; i++) begin
			if(CurBytes[i] == BytesAtOffset[i]) count++;
			else Length <= count;
		end
	end
	else Length <= 0;
end
endmodule