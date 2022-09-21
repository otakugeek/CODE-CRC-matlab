function str=getdisp(pos)
str='';
for i=1:length(pos)
    if isnan(pos(i))
        str=[str  '0' ' '];
    else
    str1=strcat(char(945),num2superscr(pos(i)));
    str1=[str1 '  '];
     str=[ str str1 ];

    end
    
end
str=['[' str ']'];
end
 