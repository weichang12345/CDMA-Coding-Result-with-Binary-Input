function y = CDMA(x, N, n)
% This function encodes a binary sequence into a output sequence by CDMA technique. The first argument is the input data. The second
% argument is the size of the Walsh matrix, which determines the output
% length per code. The third argument is the channel used to encode.

[row, col] = size(x);

% Check the input is binary
if( ~ all(ismember(x, [1,0])) )
    error("The input must be binary.")
end

% Check the number of data and channels are matched
if( row ~= 1 && col ~= numel(n)) % If input is not a row vector and the number of data and channels are not matched
    error("The number of data must match the number of the channels.")
end


% Construct the Walsh matrix

H = hadamard(N);
for i = 1 : N-1
    detect(:,i) = H(:,i) + H(:,i+1);
end
detect = detect==0; % Outputs one if there is zero crossing
zero_crossing = sum(detect,2) + 1; % Find the number of zero crossings of each rows

[~, index] = ismember((1:N),zero_crossing); % Find the index to permutate the Hadamard matrix into the Walsh matrix
W = H(index,:); % Walsh matrix


% Encode stage

c = 2*x - 1; % Turn 0 into -1
% If the input is a column vector
if(col == 1)
    y = kron(c, W(:,n));
% If the input is a row vector
elseif(row == 1)
    y = kron(c, W(n,:));
% If the input is a matrix
else
    for i = 1 : col
        y(:,i) = kron(c(:,i), W(:,n(i)));
    end
    y = sum(y,2);
end

end

