j=0;
s=0;
n=23;
k=11;
while s<=2^(n-k)
    s=s+nCk(n,j);
    j=j+1;
end
j=j-2;
t=j