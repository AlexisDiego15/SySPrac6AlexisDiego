function Respuestas

syms t;
a=ResImpulso([10 7 1],[1],10);
b=ResEntradaCero([10 7 1], [1], [1 1],10);
c=ResEstadoCero([10 7 1], [1], exp(-t)*heaviside(t),10);
d=ResTotal([10 7 1],[1], [1 1], exp(-t)*heaviside(t),10);
e=ResEsc([10 7 1],[1], heaviside(t), 10);


subplot(3,2,1)
fplot(a,[0, 5],'b','LineWidth',2); grid on;
xlabel('tiempo')
title('Respuesta al impulso')
subplot(3,2,2)
fplot(b,[0, 5],'r','LineWidth',2); grid on;
xlabel('tiempo')
title('Respuesta a entrada cero')
subplot(3,2,3)
fplot(c,[0, 5],'y','LineWidth',2); grid on;
xlabel('tiempo')
title('Respuesta a estado cero')
subplot(3,2,4)
fplot(d,[0, 5],'g','LineWidth',2); grid on;
xlabel('tiempo')
title('Respuesta total')
subplot(3,2,[5 6])
fplot(e,[0, 5],'k','LineWidth',2); grid on;
xlabel('tiempo')
title('Respuesta al escalon con condiciones iniciales 0')

end