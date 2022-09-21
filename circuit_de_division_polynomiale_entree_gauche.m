%% Author: Amadou Coulibaly 
% Ce code permet est une impl�mentation sur matlab du circuit de division 
% avec entr�e � gauche vous devez juste modifier le vecteur X(mot de code ) et le vecteur g(p�lyn�me g�n�rateur)

clear all;clc

%=================================================================== partie � modifier
X=  [ 1 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 1];% Entr�e du circuit							 		|
g=[1 0 0 1 1 0 1 0 1 0 1]; %p�lyn�me g�n�rateur									|
%===================================================================
m=length(g)-1;disp(['la phase de chargement se termine pour n= ' num2str(m)])
temp=X;
c=zeros(1,length(g)-1);
X=[X zeros(1,length(c))];
N=length(X);
aff=[];
init=['           ' ];
an=[];
for t=0:length(c)-1
    init=[init num2str(0) '     '];
end

for k=1:N
    xk=X(k);
    q=exitation_gauche(xk,g,c);
    c=q;
    aff=[aff;q];
    an=[an c(end)];
    
end
Print=[];
for i=0:length(c)-1
    Print=[Print '    '  'r' num2str(i) ];
    
end
 Print=['     X' Print ];
disp(Print);
disp(init)
    
aff=[X' aff ];
disp(aff);

% comp=size(aff);
% str1=sprintf('       ');
% last=repmat(str1,length(c),comp(2)-1  );
% last=[last num2str(fliplr(c)')];
% disp(last)


