clc
n=6; %  Symboles du mot de code
t=3; %  Capacité" de correction
k=5;
p=10^(-3); % Probabilité de transmission
Rc=k/n  % Efficacité du code 
Ga=10*log10(Rc*(t+1)) % Gain de codage
Pe=zeros(1,n-t);

for  i=t+1:n
    Pe(i)= nchoosek(n,i)*p^(i) *(1-p)^(n-i);
end
PE=sum(Pe) % Probabilité d'erreur de decodage
