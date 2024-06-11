q=1;
x=sym('x');
while q==1
    
    
    fprintf('Integración por trapecios\n\n');
    f=input('Ingrese la función\n');
    f=inline(f);
    
    a=input('Ingresa limite integral inferior \n');
    b=input('Ingresa limite integral derecho \n');
    
    n=10^4;
    h=(b-a)/n;
    
    s= 0;
    
    for i=1:(n-1)
        s=s+f(a+i*h);
    end
    s= s + (f(a)+f(b))/(2);
    s = s*h;
    
    fprintf('la solución de la integral es %5.12f\n',s);
    
    
    
    
    q = input('Para repetir pulse (1)\n');
    
    
end

clc;
fprintf('Gracias por usar\n');
clc;