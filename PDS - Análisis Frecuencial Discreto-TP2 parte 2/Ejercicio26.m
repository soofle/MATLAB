%% Ejercicio 26
%%
% Diseño de las ventanas a implementar

v1=VHanning(N);
figure
subplot(2,2,1)
plot(v1);title('Ventana Hanning');
xlabel('t'); ylabel('v(t)');

v2=VHamming(N);
subplot(2,2,2)
plot(v2);title('Ventana Hamming');
xlabel('t'); ylabel('v(t)');

v3=BarlettTriangular(N);
subplot(2,2,3)
plot(v3);title('Ventana Barlett (triangular)');
xlabel('t'); ylabel('v(t)');xlim([0 200]);ylim([0 1]);

v4=VBlackman(N);
subplot(2,2,4)
plot(v4);title('Ventana Blackman');
xlabel('t'); ylabel('v(t)');
%%

% Genero función de prueba
N=200;
Ts=0.03;
n=1:N;
w0=2*pi*Ts;
x=sin(w0*n);
figure
plot(n,x,'m');title('Función de prueba');
xlabel('t');ylabel('x(t)');
%%
% Implemento las ventanas
%%
%Hanning
y1=x.*v1;
Y1=abs(fft(y1));
%%
%Hamming
y2=x.*v2;
Y2=abs(fft(y2));
%%
%Barlett (Triangular)
y3=x.*v3;
Y3=abs(fft(y3));
%%
%Blackman
y4=x.*v4;
Y4=abs(fft(y4));
%%
figure
subplot(2,2,1)
plot(Y1);title('Ventana Hanning');
xlabel('n'); ylabel('|Y_H_a_n_n_i_n_g[n]|');
subplot(2,2,2)
plot(Y2);title('Ventana Hamming');
xlabel('n'); ylabel('|Y_H_a_m_m_i_n_g[n]|');
subplot(2,2,3)
plot(Y3);title('Ventana Barlett');
xlabel('n'); ylabel('|Y_B_a_r_l_e_t_t[n]|');
subplot(2,2,4)
plot(Y4);title('Ventana Blackman');
xlabel('n'); ylabel('|Y_B_l_a_c_k_m_a_n[n]|');
%%
clear();