TF=zpk([],[0 -2 -5],10); %notacion polos ceros y ganancia
rlocus(TF)

%h = tf([2 5 1],[1 2 3]); notación transformada 2s^2+5s+1/s^2+2s+3 
%rlocus(h)