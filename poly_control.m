n=23;
g= [
   1   1   1   1   1   0   0   1   0   0   1   0   1];
% poly2sym(gf2double(g),D)


[h,r]=deconv(gf([1 zeros(1,n-1) 1]),gf(g));
syms D
poly2sym(gf2double(h),D)

