X=  [1 0 0 0 ];% Entr�e du circuit
g=[1 0 1 1 ]; %p�lyn�me g�n�rateur

k=length(X);
n=length(g)+k-1;
n_k=length(g)-1;
comp=gf([1 zeros(1,n_k)]);

res=conv(gf(g),gf(X))

