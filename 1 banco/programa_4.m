q=1;
x=sym('x');
while q==1
    
    %Newton Raphson
    
    f=input('Ingrese su función \n');
    f=inline(f);
    m=input('Ingrese su intervalo izquierdo \n');
    n=input('Ingrese su intervalo derecho \n');
    h=input('Ingrese su incremento \n');
    if m==n
        fprintf('ERROR: LOS INTERVALOS DEBEN SER DIFERENTES!!\n');
    else
        s=[];
    v=[];
    
    s= metodoNewton(m,n,h,f);
    v=[v,s];
    
    v = unique(v);
    raices = numel(v);
   
    
    if raices >0 
        fprintf('La raíz o raices de la función son\n');
        disp(v)
    else
        fprintf('No se hallaron raices de la función ingresada con metodo Newton Raphson\n');
        
    end
    end
    
    
    
    
    
    
  
   
    
    
    q= input('Para repetir pulse(1)\n');
    clc;
end 

fprintf('Gracias por usar\n');
pause(0.5)
clear;
clc;


function s= metodoNewton(m,n,h,f)
x=sym('x');
if m>n
    p=m;m=n;n=p;
end
s=[];
a=m;
b=a+h;

while b<=n
    alfa = a;
    omega = b;
    
    if f(alfa)== 0
        s=[s,alfa];
    else
        if f(alfa)*f(omega)==0
            s=[s,omega];
            
        else
            if f(alfa)*f(omega)>0
                %nada
            else
                %metodo newtonRaphson
                fprintf('La  solución está entre %5.12f y %5.12f\n',alfa,omega);
                disp(f)
                fp = input('Ingrese la primera derivada de f\n','s');
                fpp = input('Ingrese su segunda derivada de f\n','s');
                fp=inline(fp);
                fpp=inline(fpp);
                
                if abs(fp(alfa)*fpp(alfa)/fp(alfa)^2)<1 || abs(fp(omega)*fpp(omega)/fp(omega)^2)<1
                    if abs(fp(alfa)*fpp(alfa)/fp(alfa)^2)<1
                        while abs(f(alfa))>10^(-12)
                            alfa = alfa - f(alfa)/fp(alfa); 
                        end
                    else
                        while abs(f(omega))>10^(-12)
                            omega = omega - f(omega)/fp(omega); 
                        end
                        alfa = omega;
                    end
                    
                    s=[s,alfa];
                    
                end
                
            end
            
        end
    end
    
    a=b;
    b=a+h;
    
end 






end