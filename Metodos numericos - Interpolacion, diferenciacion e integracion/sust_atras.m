function X = sust_atras(A,B)

if (nargin<2)
    disp('Ingrese una matriz cuadrada y un vector')
end

n=size(A,1);
X=zeros(n,1);

X(n,1)=B(n,1) / A(n,n);


for k=n-1:-1:1
    m=0;
    for v=k+1:1:n
        m=m+(A(k,v)*X(v,1));
    end
    
    X(k,1)=(B(k,1)-m)/A(k,k);
end


    