%decodage BCH:===================================
clear all;
clc

k=5;
m=4;%GF(2^m)
n=2^m-1;
t=3;
prim_poly=25;%pôlynôme primitif
%===Entrer la beta a decoder=====
beta=gf([1   0   0   1   0   1   1   0   0   1   0   0   1   1   0]   ,m,prim_poly);
%================================================


a=gf(2, m, prim_poly);
beta=gf(beta, m, prim_poly);
S=gf(zeros(1, 2*t), m, prim_poly);
for i=1:2*t
    S(i)=polyval(beta, a^i);
end
%affichage du syndrome: S1 S2 S3 S4 ..... S(2t-1);

cprintf('blue',['S= ' '[' num2str(gf2dec(S,m,prim_poly)) ']'  '=' getdisp(getpower(S,m,prim_poly))]);fprintf('  \n \n ');

if S==0
    disp("pas d'erreur ")
    return
else
    
     cprintf('blue','Smatrix= ');fprintf('  \n \n ');
    
    
    %===========================
    S_matrix= gf(zeros(t), m, prim_poly);
    for i=1:t
            S_matrix(i, :)= S(i : i+t-1);
            z=S(i : i+t-1);
            cprintf('blue', getdisp(getpower(z,m,prim_poly)));fprintf('  \n \n ');

    end    
    B=S(t+1: 2*t);
    B=B';
   
    %======les coeficient de F(D)======
end
    
    
    if det(S_matrix)~=0
        sigma= S_matrix \ B ; 
        
        F=gf([1 fliplr(sigma')], m, prim_poly);
        cprintf('blue',[char(963) '= ' '[' num2str(gf2dec(fliplr(sigma'),m,prim_poly)) ']' '=' getdisp(getpower(fliplr(sigma'),m,prim_poly))]);fprintf('  \n \n ');
        cprintf('blue',['F' '= ' '[' num2str(gf2dec(F,m,prim_poly)) ']' '=' getdisp(getpower(F,m,prim_poly))]);fprintf('  \n \n ');
        %======les racines de F(D)========
        deltas=roots(F);
         cprintf('blue',['racine= ' '[' num2str(gf2dec(deltas,m,prim_poly)) ']' '=' getdisp(getpower(deltas,m,prim_poly))]);fprintf('  \n \n ');
        At=a.^(0:n-1);
     
    pos=[];
    for q=1:length(deltas);
        er=deltas(q);
       pos=[pos find(At==er)];
    end
    temp=pos;
    position_erreur=pos-1;
    disp(['la position des erreurs est: [' num2str(position_erreur) ']']);fprintf('  \n \n ');
    
    Corrbeta=fliplr(beta);
    Corrbeta(temp)=Corrbeta(temp)+1;
    betaCorrige=fliplr(Corrbeta);
    cprintf('blue',['betaCorrige= ' '[' num2str(gf2dec(betaCorrige,m,prim_poly)) ']']);fprintf('  \n \n ');
    return
    
    
    else
        disp("le determinant est nul ")
    end
    o= S_matrix;
    b=B;
     p=det(S_matrix);
    k=1;
    while (p==0) 
        k= k+1;
        S_matrix=o(k:end,k:end);
         p=det(S_matrix);
         B=b(k:end);
        
    end
    
    
     sigma= S_matrix \ B ; %sigma(0) sigma(1) ....  sigma(t-2)... sigma(t-1)
      cprintf('blue',[char(963) '= ' '[' num2str(gf2dec(fliplr(sigma'),m,prim_poly)) ']' '=' getdisp(getpower(fliplr(sigma'),m,prim_poly))]);fprintf('  \n \n ');
        F=gf([1 fliplr(sigma')], m, prim_poly);
        cprintf('blue',['F= ' '[' num2str(gf2dec(F,m,prim_poly)) ']' '=' getdisp(getpower(F,m,prim_poly))]);fprintf('  \n \n ');
        %======les racines de F(D)========
        deltas=roots(F);
        cprintf('blue',['racine= ' '[' num2str(gf2dec(deltas,m,prim_poly)) ']='  getdisp(getpower(deltas,m,prim_poly))]);fprintf('  \n \n ');

        
     At=a.^(0:n-1);
     
    pos=[];
    for q=1:length(deltas);
        er=deltas(q);
       pos=[pos find(At==er)];
    end
    temp=pos;
    position_erreur=pos-1;
    cprintf('blue',['la position des erreurs est: [' num2str(position_erreur) ']']);fprintf('  \n \n ');
    
    Corrbeta=fliplr(beta);
    Corrbeta(temp)=Corrbeta(temp)+1;
    betaCorrige=fliplr(Corrbeta);
    cprintf('blue',['betaCorrige= ' '[' num2str(gf2dec(betaCorrige,m,prim_poly)) ']']);fprintf('  \n \n ');


    
        
    
    
    
    





