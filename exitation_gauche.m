function q=exitation_gauche(xk,g,c)
    g=fliplr(g);
    m=length(g);
    r=zeros(1,m-1);
    for j=1:m-1
        if j==1
                r(j)=xor(xk,c(m-1));
                
        else
            r(j)=xor( and ( c(m-1) , g(j) )  ,   c(j-1));
        end
        
            
    end
    q=r;
end