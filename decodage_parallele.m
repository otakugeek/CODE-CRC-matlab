X=[ 1   1   0   0   1   0   0];
g=gf([1 1 0 1]);
n=length(X);
k=n-length(g)+1;
g=gf(g);
G=gf(eye(k,n));
for i=1:4
[h,r]=deconv(G(i,:),g);
G(i,:)= G(i,:)+r;
end
G
P=[G(:,k+1:end)];
H=[P;eye(n-k)];



X=gf(X);
synd=X*H;

disp(['synd=' num2str(gf2double(synd))])
[li,col]=size(H);
pos=NaN;

if synd==0
    disp("pas d'erreur");
    return
end
for i=1:li
    if H(i,:)==synd
        pos=i;
    end
end

if isnan(pos)
    disp('le syndrome obtenu ne se trouve pas dans la matrice H');
else
    disp(['on a une erreur à la position ', num2str(pos)])
end
 