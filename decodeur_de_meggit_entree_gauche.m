%% Author: Amadou Coulibaly 
% Ce code permet est une impl�mentation du circuit de d�codage de Meggit 
% avec comme circuit de division le circuit d'entree � droite

clear all;clc
%===========================================================
X= [ 1 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 1]; % Mot de code � decoder                 |
g=[1 0 0 1 1 0 1 0 1 0 1]; %p�lyn�me g�n�rateur                          |
%===========================================================
m=length(g)-1;disp(['la phase de chargement se termine pour n= ' num2str(m)])
init=['           ' ];
   
n=length(X);
tab_err=[];
m=length(g)-1;
c=zeros(1,m);
N=length(X);
aff=[];
init=['           ' ];
[gggg,erreur]=deconv(gf([1 zeros(1,N-1)]),gf(g));
erreur=gf2double(erreur(end:-1:end-m+1));
 Xcorrect=X;
for t=0:length(c)-1
    init=[init num2str(0) '     '];
end
init=[init  '           '  'initialisation'];

for p=1:N
    xk=X(p);
    q=exitation_gauche(xk,g,c);
    c=q;
    aff=[aff;q];
    
end
 temp=X;
  er=0;
if c==erreur
        er=1;
       temp(1)=xor(temp(1),1);
       Xcorrect(1)=xor(Xcorrect(1),1);
end
 b=temp;
 tab_err=[tab_err; er];


 for k=1:N-1
    
    b=lshift(b,1);
    [q,r]=deconv(gf(b),gf(g));
    c=fliplr(gf2double(r));
    c=c(1:m);
    aff=[aff;c];
    er=0;
    if c==erreur
        er=1;
        disp('detection')
        temp=X;
        temp(k+1)=xor(temp(k+1),1);
        Xcorrect(k+1)=xor(Xcorrect(k+1),1);
        b=lshift(temp,k);
%         b=lshift(b,k);
        
        
    end
    tab_err=[tab_err; er];
 end
    





Print=[];

for i=m-1:-1:0
    Print=[Print '    '  's' num2str(i) ];
    
end
 Print=['  bi/ei' Print '    ei' '    ai'];
disp(Print);
disp(init);
[M,N]=size(aff) ; 
% Xcomp=[X';repmat(NaN,M-length(X'),1)];

ai=[repmat(NaN,length(X')-1,1);Xcorrect'];
tab_err=[repmat(NaN,length(X')-1,1);tab_err];
Xcomp=[X';tab_err(n:end-1)];
aff=[Xcomp fliplr(aff) tab_err ai];
% affichage(aff,erreur,"d�tection de l'erreur");
disp(aff)

disp("N'�crivez pas les NaN remplacez les par des cases vides")