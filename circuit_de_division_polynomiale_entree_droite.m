%% Author: Amadou Coulibaly 
% Ce code permet est une implémentation sur matlab du circuit de division 
% avec entrée à droite vous devez juste modifier le vecteur X(mot de code ) et le vecteur g(pôlynôme générateur)

clear all;clc

%=================================================================== partie à modifier
X=  [0     1     0     0     0     1     1     0     1     0     0];% Entrée du circuit							 		|
g=[1 1 1 1 1 0 0 1 0 0 1 0 1]; %pôlynôme générateur									|
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


