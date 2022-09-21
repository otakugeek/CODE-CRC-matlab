clc
m=4;
t=5;
prim_poly=25;
a=gf(2,m,prim_poly); %a=alpha
A=a.^[1:2*t] ; 

%RS

%Calcul du polynome générateur
g=[gf(1,m,prim_poly)];
for i=1:2*t,
    p=[gf(1,m,prim_poly) A(i)]; %D+a^i
    g=conv(g,p);
end
cprintf('blue',['g= ' '[' num2str(gf2dec(g,m,prim_poly)) ']' '=' getdisp(getpower(g,m,prim_poly))]);fprintf('  \n \n ');

X=gf([6 9 12 15 2 ],4,prim_poly); % le vecteur à encoder

X=[X zeros(1,2*t)];

 [Q R]=deconv(X,g); % R(D)=D^(2t)*X(D)%g(D)%%
    X=X+R;
    
    
cprintf('blue',['X= ' '[' num2str(gf2dec(X,m,prim_poly)) ']' '=' getdisp(getpower(X,m,prim_poly))]);fprintf('  \n \n ');
    
    
    aff=gf2dec(X,m,prim_poly);
    aff=dec2hex(aff);
    disp(['la valeur en hexadécimal:']);
    cprintf('blue',aff');fprintf('  \n \n ');
   