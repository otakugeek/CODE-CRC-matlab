% pour un code C(n,k)


clear all;clc
n= 23 ;   % donner la longueur du mot dans le canal n  !!!!!!!!!!!!!
k= 11;  % donner le nombre de bit d information k      !!!!!!!!!!!!!!
p= 10^(-3); % donner la probabilité d erreur transmission p !!!!!!!!!!!!!

%----------------------------------------------------------------------------------------
disp([' on sait que : Wmin < n*2^(k-1)/2^(k)-1'  ])

x=n*2^(k-1);
y=2^k-1;
disp([' '   ])
disp(['DONC: dmin=Wmin|max=' num2str(floor(x/y))  ])
z=floor(x/y)-1;
disp([' '   ])
disp([' Capacité de correction d erreur: Cc=[dmin-1 /2]=' num2str(floor(z/2))  ])
disp([' '   ])
disp([' Capacité de detection d erreur: Cd=(dmin -1)=' num2str(z)  ])

Cc=floor(z/2);
disp([' '   ])

disp([' la probabilité d erreur de decodage est : Pe= 1- sigma 0<i<t de (C(n,i)*p^(i)*(1-p)^(n-i))=' num2str(probaerrdec(p,n,Cc))  ])
disp([' '   ])
eff=k/n;
disp(['efficacite=' num2str(k) '/' num2str(n) '=' num2str(eff)])
disp([' '   ])
gain=Ga(n,k,Cc);
disp(['Ga=10*log10((t+1)*(k/n))='  num2str(gain)])

