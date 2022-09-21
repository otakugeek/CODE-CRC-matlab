n=7;
k=4;
g=gf([1 0 1 1]);
G=gf(eye(k,n));
for i=1:4,
[h,r]=deconv(G(i,:),g);
G(i,:)= G(i,:)+r;
end
G
P=[G(:,k+1:end)];
H=[P;eye(n-k)];