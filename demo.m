clear;

% The syntax of the function is y = CDMA(x, N, n).
% 
% The first argument is the input data. It can be a column vector, a row vector, or a matrix.
% If the input is a matrix, then the function will encode the data
% column-by-column, with the corresponding channel of n.
% 
% The second argument is the size of the Walsh matrix, which determines the output length per code.
% 
% The third argument is the channel used to encode. If the input is a
% matrix, then n has to be an array with its length equals to the column number of the input.

% Example 1
x = [1 0 1]; % x is a row vector
N = 4;       % Size of the Walsh matrix
n = 1;       % Use channel 1 to encode
y_example_1 = CDMA(x, N, n);

% Example 2
x = [0; 1; 1; 0]; % x is a column vector
N = 8;       % Size of the Walsh matrix
n = 8;       % Use channel 8 to encode
y_example_2 = CDMA(x, N, n);

% Example 3

% Encode step
x = [1 1; 0 1; 1 0]; % x is a matrix
N = 8;       % Size of the Walsh matrix
n = [1 2];       % Use channel 1 to encode the first data, and use channel 2 to enode the second data
y_example_3 = CDMA(x, N, n);

% Decode step
W = load("walsh_matrix.mat").W;

% Decode the sequence by channel 1
decode_c1(1,:) = dot(y_example_3(1:8), W(:,1))/N;
decode_c1(2,:) = dot(y_example_3(9:16), W(:,1))/N;
decode_c1(3,:) = dot(y_example_3(17:24), W(:,1))/N;
x_hat_c1 = (decode_c1 + 1)/2;

% Decode the sequence by channel 2
decode_c2(1,:) = dot(y_example_3(1:8), W(:,2))/N;
decode_c2(2,:) = dot(y_example_3(9:16), W(:,2))/N;
decode_c2(3,:) = dot(y_example_3(17:24), W(:,2))/N;
x_hat_c2 = (decode_c2 + 1)/2;


