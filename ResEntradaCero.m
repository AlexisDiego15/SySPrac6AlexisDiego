function [REntC]=ResEntradaCero(a,b,ciy,t0)
close all
tam=size(a);
tami=size(b);
syms y(t) Y(s) x(t) X(s) Yy fp;
syms edd edi 
edd=0;
edi=0;
for i=1:tam(2)
   edd=edd+a(i)*s^(i-1)*Y(s);
   for k=1:i-1
       edd=edd-a(i)*(s^(i-1-k)*ciy(k));
   end
end

for i=1:tami(2)
   edi=edi+b(i)*s^(i-1)*X(s);
end

edi=subs(edi,X(s),0);
edd=collect(edd,Y(s));
edd=subs(edd,Y(s),Yy);
eq1=edd==edi;
edd=solve(eq1, Yy);

y(t)=ilaplace(edd);
pretty(y(t))
REntC=y;
figure (1)
hFig = figure(1);
set(hFig, 'Position', [0 0 900 900])

fplot(y,[0,t0],'r','LineWidth',2)

legend('Salida y(t)','Location','Best')
xlabel('tiempo','FontWeight','bold','FontSize',16)
title('Entrada y Respuesta a entrada cero','FontWeight','bold','FontSize',16)
grid on

end