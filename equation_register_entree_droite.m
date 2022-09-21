clc
g=[1 0 1 1];
i=length(g);
last= length(g)-2;
disp(['r0(n)=X(n)+r' num2str(last) '(n-1)']);

for j=1:last
    aff=[];
    aff=['r' num2str(j) '(n)=' 'r' num2str(j-1) '(n-1)'];
    if g(i-j)==1
        aff=[ aff '+r0(n)' ];
    end
    disp(aff)
end
    
    