function r=Retardo_Grupo(h,N)

%h[n] sistema y H[n] su respuesta al impulso
%N: cantidad de puntos

n=0:N-1;
r=real((fft(n'.*(h)))./fft(h));