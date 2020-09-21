%s=tf('s');
%g=(0.4)/(s^3+0.3*s^2-0.9*s-0.4)
%sisotool(g)

s=tf('s');
a=(9-3*s)/(s+1)/(s+7)
figure(1)
step(a)
%o tambien se puede poner:
%anum=[-3 9];
%aden=[1 8 7];
%figure(2)
%step(anum,aden)

b=(4*s+2)/(s)/(s+1)/(s+2)
figure(3)
step(b)

c=(4*s^2+7*s+4)/(s+2)/(s^2+s+1)
figure(6)
step(c)

d=(3*s^2-2*s+1)/(s-3)/(s-2)/(s-1)
figure(4)
step(d)

e=(s^2+4*s+5)/(s^3+2*s^2+3*s+2)
figure(5)
step(e)

f=(5*s+12)/(s^2+5*s+6)
figure(7)
step(f)
