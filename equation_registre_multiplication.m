clc
h=[1 1 0 1 0 1];

    ind=find(fliplr(h)==1);
    k=length(h)-1;
    aff=['C' num2str(k-1) '(n)'  '=C0(n-1)' ];
   for i=ind(2:end-1);
       aff=[aff '+C' num2str(i-1) '(n-1)'];
   end
   disp(aff);
   
   for i=0:k-2
       aff=[];
       aff=['C' num2str(i) '(n)'  '=C' num2str(i+1) '(n-1)' ];
       disp(aff);
   end
