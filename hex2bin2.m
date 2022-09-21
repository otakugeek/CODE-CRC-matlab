function y=hex2bin2(X,n)
y=hexToBinaryVector(X);
if length(y)<n
    y=[zeros(1,n) y];
end

if length(y)>n
    y=fliplr(y);
    y=y(1:n);
    y=fliplr(y);
end
    
end