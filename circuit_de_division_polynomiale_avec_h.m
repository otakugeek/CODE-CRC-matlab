%% Author: Amadou Coulibaly 
% Ce code permet est une implémentation sur matlab du circuit de division avec k decalage
%  vous devez juste modifier le vecteur X(mot de code ) et le vecteur h(pôlynôme de contrôle) et n
clear all;clc;
%========================================================================================
n=15;     %taille du mot de code 
X=[1 0 0 1 0];% Entrée du circuit							 		|
h=[1 1 0 1 0 1];  %pôlynôme de contrôle													|
%========================================================================================


 
k=length(h)-1;
N=length(X);
c=X;
affc=[];
for i=1:n-k
    q=exitation_avec_h(h,c);
    c=q;
    b=fliplr(q);
    affc=[affc;b];
end





shift=[];
s=X';
for j=0:k-1
    d=[zeros(j,1) ;s(1:end-j)];
    shift=[shift d ];
end



Print=[];
init=['           ' ];
for t=1:k
    init=[init num2str(0) '     '];
end
for i=k-1:-1:0
    Print=[Print '    '  'c' num2str(i) ];
    
end
 Print=['     X' Print '     an'];
colX=[X';repmat(NaN,n-k,1) ];
tab=[shift;affc];
tab=[colX tab];
an=tab(:,2);
tab=[tab an];

disp(Print);
disp(init);
disp(tab);


disp(['an=' num2str(tab(:,end)') ]);

display(['Ne recopier pas les Nan, remplacer les par des cases vides ']);


