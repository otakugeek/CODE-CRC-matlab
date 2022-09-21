%% Author: Amadou Coulibaly 
% Ce code permet est une implémentation du circuit de décodage de Meggit 
% avec comme circuit de division le circuit d'entree à droite

clear all;clc
%===========================================================
X= [1 1 1 0 0 1 1]; % Mot de code à decoder                 |
g=[1 0 1 1 ]; %pôlynôme générateur                          |
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
erreur=[zeros(1,length(g)-2) 1];
 Xcorrect=X;
for t=0:length(c)-1
    init=[init num2str(0) '     '];
end
init=[init  '           '  'initialisation'];

for p=1:N
    xk=X(p);
    q=exitation_droite(xk,g,c);
    c=q;
    aff=[aff;q];
    
end
 temp=X;
 er=0;
if c==erreur
        er=1
       temp(1)=xor(temp(1),1);
       Xcorrect(1)=xor(Xcorrect(1),1);
end
tab_err=[tab_err; er];
 b=lshift(temp,m);


 for k=1:N-1
    
    b=lshift(b,1);
    [q,r]=deconv(gf(b),gf(g));
    c=fliplr(gf2double(r));
    c=c(1:m);
    aff=[aff;c];
    er=0;
    if c==erreur
        er=1;
        temp=X;
        temp(k+1)=xor(temp(k+1),1);
        Xcorrect(k+1)=xor(Xcorrect(k+1),1);
        b=lshift(temp,m);
        b=lshift(b,k);
        
        
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

ai=[repmat(NaN,length(X')-1,1);Xcorrect'];
tab_err=[repmat(NaN,length(X')-1,1);tab_err];
Xcomp=[X';tab_err(n:end-1)];
aff=[Xcomp fliplr(aff) tab_err ai];
% affichage(aff,erreur,"détection de l'erreur");
disp(aff)

disp("N'écrivez pas les NaN remplacez les par des cases vides")