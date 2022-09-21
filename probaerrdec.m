function y=probaerrdec(p,n,Cc)
proba=0;
for i=Cc+1:n
    proba =proba+nCk(n,i)*(p^i)*((1-p)^(n-i));
end
y=proba;
end