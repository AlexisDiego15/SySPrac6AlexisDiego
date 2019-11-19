function [FT] = FunTransferencia(a,b)
close all
tam=size(a);
tami=size(b);
syms y(t) Y(s) x(t) X(s) Yy fp H(s);
syms edd edi 
edd=0;
edi=0;

for i=1:tam(2)
   edd=edd+a(i)*s^(i-1)*H(s);
end

for i=1:tami(2)
   edi=edi+b(i)*s^(i-1);
end

edd=collect(edd,H(s));
edd=subs(edd,H(s),Yy);
eq1=edd==edi;
edd=solve(eq1, Yy);
pretty(edd)

FT=edd;
end
