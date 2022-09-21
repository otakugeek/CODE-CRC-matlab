clc
%============================================================================
P=[1 1 1, 1 0 1,0 1 1]; %matrice P et séquence à coder
X=[  1 1  0];%sequence d'entree
k=1;%nombre d'entrée
n=3;%nombre de symboles de sorties
%=============================================================================
[mp,np]=size(P);
L=mp+1;
colg=np+n*(length(X)-1);
lig=mp*length(X);
G=zeros(lig,colg);
decli=1;
deccol=1;
pasvert=mp;
for i=1:length(X)
    G(decli:decli+mp-1,deccol:deccol+np-1)=P;
    decli=decli+mp;
    deccol=deccol+n;
end
taille=(length(X)/k+L-2)*n
G=G(1:length(X),:);
res=gf(X)*gf(G);
res=res(1:taille)