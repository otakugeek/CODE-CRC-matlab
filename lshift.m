function y=lshift(x,i)
n=length(x);
y=circshift(x,n-i);

end
