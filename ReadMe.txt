
CDMA Coding Result with Binary Input
------------------------------------------------------------------------------------------------------------

Syntax

	y = CDMA(x, N, n)

------------------------------------------------------------------------------------------------------------

Description

	The first argument is the input data. It can be a column vector, a row vector, or a matrix.
	If the input is a matrix, then the function will encode the data column-by-column, with the corresponding channel of n.

	The second argument is the size of the Walsh matrix, which determines the output length per code.

	The third argument is the channel used to encode. If the input is a matrix, then n has to be an array with its length equals to the column number of the input.
	If the number of the channels does not match the column number of the input, an error will report.
	
	The output is the encoded sequence, which is a column vector.

------------------------------------------------------------------------------------------------------------

	For more details and examples, see also demo.mlx. 
