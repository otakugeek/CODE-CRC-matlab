%% Author: Amadou Coulibaly 
% Ce code permet est une implémentation du circuit de décodage
% par piégeage de l'erreur avec comme circuit de division le circuit d'entree à droite


clear all;clc
%pas fini
%==================================================================================================
X=[1   1   0   0   0   0   1   0   0   0   0   1   0   1   1   0   0   0   0   1   0   0   0]; % Mot de code à decoder  
g=[1 1 1 1 1 0 0 1 0 0 1 0 1]; %pôlynôme générateur      
% X=[1 1 0 1 1 0 1]
% g=[1 0 1 1]
Ct=3;%capacité de correction                                        
%==========================================================================================================
init=['           ' ];
   
n=length(X);

m=length(g)-1;disp(['la phase de chargement se termine pour n= ' num2str(m)])
c=zeros(1,m);
N=length(X);
aff=[];
init=['           ' ];
erreur=[zeros(1,length(g)-2) 1];
 Xcorrect=X;
for t=0:length(c)-1
    init=[init num2str(0) '     '];
end
init=['      ' init];
init=[init  '           '  'initialisation'];

for p=1:N
    xk=X(p);
    q=exitation_gauche(xk,g,c);
    c=q;
    aff=[aff;q  NaN];
    
end
prem=0;%après calcul du syndrome de beta 

etap=1:p;
 temp=X;
 b=lshift(temp,0);
 poids=sum(c);
 
 aff(end,end)=poids;
 Print=[];
 Print=['     n' '    bi' ];

for i=0:length(c)-1
    Print=[Print '    '  's' num2str(i) ];
    
end
 


Print=[ Print '    poids'];
disp(Print);

disp(init)

if poids<=Ct
     bav=b;
      b=gf(b)+gf([zeros(1,N-m) fliplr(c)]);
      b=gf2double(b);
      
        [line,colum]=size(aff) ; 
        Xcomp=[X';zeros(line-length(X),1)];
        aff=[etap'  Xcomp  aff   ];

    
        disp(aff);
     
      
      
      
      
      
%       Début bla bla éffaçable
      disp(['le mot decodé est le ' num2str(prem) 'ème décalage à droite de'  ])
       disp([num2str(bav) ]);
       disp(' + ')
      err=[zeros(1,N-m) fliplr(c) ];
      disp(num2str(err));
      disp('---------------------------------------')
      disp(num2str(b));
       
      disp(['Après ' num2str(prem) ' décalages à droite on a']);
     
      disp(circshift(b,prem));
      
%       fin bla bla éffaçable
      return
end


 for k=1:N
    etap=[etap k];
    b=lshift(b,1);bav=b;
    [q,r]=deconv(gf(b),gf(g));
    c=fliplr(gf2double(r));
    c=c(1:m);
    
    poids=sum(c);
    aff=[aff;c poids];
    if poids<=Ct
       b=gf(b)+gf([zeros(1,N-m) fliplr(c)]);
       b=gf2double(b);
       
       
       
         [line,colum]=size(aff) ; 
         Xcomp=[X';zeros(line-length(X),1)];
         aff=[etap'  Xcomp  aff   ];

    

        disp(aff);
        
        
        
        
%           Début bla bla éffaçable
      disp(['le mot decodé est le ' num2str(k) 'ème décalage à droite de'  ])
       disp([num2str(bav) ]);
       disp(' + ')
      err=[zeros(1,N-m) fliplr(c) ];
      disp(num2str(err));
      disp('---------------------------------------')
      disp(num2str(b));
       
      disp(['Après ' num2str(k) ' décalages à droite on a']);
     
      disp(circshift(b,k));
      
      
      
      
       
       return
     
     
        
    end
 end

 
 [line,colum]=size(aff) ; 
Xcomp=[X';zeros(line-length(X),1)];
aff=[etap'  Xcomp  aff   ];

    
disp(aff);
disp('le poids est superieur a la capacite de correction')

