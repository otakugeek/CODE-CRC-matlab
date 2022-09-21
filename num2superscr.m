function puis=num2superscr(el)
    tab=[char(8304) char(185)  char(178) char(179)  char(8308:8308+5) ];
    x=num2str(el);
    puis=[];
    for i=1:length(x)
        puis=[puis tab(str2num(x(i))+1)];
    end
end