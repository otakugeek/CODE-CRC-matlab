clear
clc
% ===========================================================================
% Si on veut definir le pôlynôme primitif comme un polynôme décommenter les
% 2 lignes suivantes

prim_poly= 25;
% prim_poly=[1 0 0 1 1];
% prim_poly=bin2dec(num2str(prim_poly));
m=4;
t=3;
%=====================================================================
n=2^m-1;
alpha=gf(2,m,prim_poly);

g=minpol(alpha);
 for i=3:2:2*t-1
     g=conv(g, minpol(alpha^i));
 end
%====polynome generateur:
g

syms D
poly2sym(gf2double(g),D)

