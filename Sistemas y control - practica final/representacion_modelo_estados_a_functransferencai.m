A=[0 1;-25 -4];
B=[1 1;0 1];
C=[1 0;0 1];
D=[0 0;0 0];
[NUM1,den1]=ss2tf(A,B,C,D,1)

[NUM2,den2]=ss2tf(A,B,C,D,2)
printsys(NUM1,den1)
printsys(NUM2,den2)

%sys=tf(num,den)
%sys=ss(A,B,C,D)
%step(sys)