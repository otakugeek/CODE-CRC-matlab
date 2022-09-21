function pow=getpower(l,m,id)
n=2^m-1;
a=gf(2, m, id);
At=a.^(0:n-1);
     
    pos=repmat(NaN,size(l));
    for q=1:length(l)
        er=l(q);
        temp=find(At==er);
        if length(temp)~=0
             pos(q)= find(At==er)-1;
         end
    temp=pos;
    position_erreur=pos;
    pow=position_erreur;
end