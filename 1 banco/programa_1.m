q=1;
x=sym('x');


while q==1
    
f= input('Ingrese su función\n');

f=inline(f);

m = input('Ingrese el intervalo izquierdo\n');
n = input('Ingrese el intervalo derecho\n');
h= input('Ingrese el incremento\n');
s=[];
v=[];

if m==n
    fprintf('ERROR!!: No puede ser iguales los intervalos\n');
else
    if m>n
        c=m;m=n;n=c;
    end
    
    a= m;
    b= a +h;
    while b<=n
        alfa = a;
        omega= b;
        if f(alfa)==0
            s=[s,alfa];
        else
            if f(alfa)*f(omega)==0
                s=[s,omega];
                
            else
                if f(alfa)*f(omega)>0
                    %nada
                else
                    c= (alfa+omega)/2;
                    while abs(f(c))>10^(-12)
                        if f(c)*f(alfa)>0
                            alfa = c;
                        else
                            omega = c;
                        end
                        c= (alfa+omega)/2;
                    end
                    s= [s,c];
                end
                
            end
        end
        a=b;
        b=a+h;
        
    end
    %s= unique(s);
    fprintf('la raiz o raices de la función es: \n');
    
    
    cantidad = numel(s);
    if cantidad ==0
        fprintf('No hay soluciones dentro del intervalo %5.12 y %5.12\n',m,n);
    else
        disp(s)
    end
    
    
    
    
end

    
    
    
    
    
    
    
    
    
    
    
    q=input('Para repetir pulse (1)\n');
end 


clc;
fprintf('Gracias por usar\n');
pause(0.5)
clear;
clc;
