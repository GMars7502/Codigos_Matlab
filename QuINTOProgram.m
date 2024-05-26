
% Lineas para ver grafica del seno, con la sucession de taylor()(para ejecutar en el command window)
% x = linspace(0,2*pi,1000);
% y=x-(1/factorial(3))*(x.^3)+(1/factorial(5))*(x.^5)-(1/factorial(7))*(x.^7)+(1/factorial(9))*(x.^9)-(1/factorial(11))*(x.^11)+(1/factorial(13))*(x.^13)-(1/factorial(15))*(x.^15);plot(x,y,'b','linewidth',1)




x=sym('x');

Q=1;

while Q==1

    clear;
    clc;
    %PROGRAMA SOBRE EL SENO
 
    x=input('ingrese el ángulo en radianes \n');
    y=x;
    if x>=(2*pi)
        x=mod(x,(2*pi));
    
    
    else
        if x<= -(2*pi)
            x=abs(x);
            x=mod(x,(2*pi));
            x=-x;
        end
    end
    
    
    s=0;
    for i=1:1:17
        s=s+(((-1)^(i+1))*(x^(2*i-1)))/factorial(2*i-1);
    end
    
    fprintf('el valor calculador de sen es %f\n',s);
    fprintf('Comparar \n');
    sin(y)
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    Q=input('Para volver a hacer pulse (1)\n');
end

clear;
    clc;
    
    