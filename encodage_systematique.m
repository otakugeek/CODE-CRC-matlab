clc
X=  [1     0     0     1     0     1     0     1     0     1     1];% Entr�e du circuit
g= [1 1 1 1 1 0 0 1 0 0 1 0 1];  %p�lyn�me g�n�rateur

k=length(X);
n=length(g)+k-1;
n_k=length(g)-1;
comp=gf([1 zeros(1,n_k)]);
res=conv(comp,gf(X));
[q,r]=deconv(gf(res),gf(g));
res=gfadd(gf2double(res),gf2double(r))

