%% Author: Amadou Coulibaly 
% Ce code permet est une impl�mentation sur matlab du circuit de division 
% avec entr�e � droite vous devez juste modifier le vecteur X(mot de code ) et le vecteur g(p�lyn�me g�n�rateur)

clear all;clc

%=================================================================== partie � modifier
X=  [0     1     0     0     0     1     1     0     1     0     0];% Entr�e du circuit							 		|
g=[1 1 1 1 1 0 0 1 0 0 1 0 1]; %p�lyn�me g�n�rateur									|
%===================================================================
m=length(g)-1;disp(['la phase de chargement se termine pour n= ' num2str(m)])
c=zeros(1,length(g)-1);
N=length(X);
aff=[];
init=['           ' ];

for t=0:length(c)
    init=[init num2str(0) '     '];
end

for k=1:N
    xk=X(k);
    q=exitation_droite(xk,g,c);
    c=q;
    aff=[aff;q];
    
end
Print=[];
for i=0:length(c)-1
    Print=[Print '    '  'r' num2str(i) ];
    
end
 Print=['     X' Print '     an'];
disp(Print);
disp(init)
    
aff=[X' aff X'];
disp(aff);

comp=size(aff);
str1=sprintf('       ');
last=repmat(str1,length(c),comp(2)-1  );
last=[last num2str(fliplr(c)')];
disp(last)


