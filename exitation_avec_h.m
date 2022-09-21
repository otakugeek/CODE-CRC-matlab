function q=exitation_avec_h(h,c)
    ind=find(fliplr(h)==1);
    k=length(h)-1;
    r=zeros(1,k);
    r(end)= mod(sum(c(ind(1:end-1))),2);
    temp=c;
    r(end-1:-1:1)=c(end:-1:2);
    q=r;
end