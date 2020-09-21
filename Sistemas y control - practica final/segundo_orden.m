zita=0.52;
wn=40.48;

G=tf([wn^2],[1 2*zita*wn 0]);
H=tf([1],[1]);
F=feedback(G,H); %me va a dar wn^2 / s^2+2*zita*wn*s+wn^2
step(F)
hold on

%o tambien
%wn=5;
%damping-ratio=0.4;
%[num0,den]=ord2(wn,damping-ratio);
%num=5p2*num0;
%printsys(num,den,'s')