

q=1;
x= sym('x');

while q==1 
    
    f = input('Ingrese su función papu\n');
    
f= inline(f);

    m=input('Ingrese el intervalo izquierdo\n');
    n=input('Ingrese el intervalo derecho\n');
    h=input('Ingrese el incremento\n');
    s=[];
    if m==n
        fprintf('ERROR!!: no deber ser iguales los intervalos\n');
    else
        if m>n
           pro=m;m=n;n=pro; 
        end
        
        a=m;
        b=a+h;
        
        while b<=n
            alfa = a;
            omega = b;
            if f(alfa)==0
                s=[s,alfa];
            else
                if f(alfa)*f(omega)==0
                    s=[s,omega];
                else
                    if f(alfa)*f(omega)>0
                        %nada
                    else
                        %metodo falsi
                        c= omega-((f(omega)*(omega-alfa))/(f(omega)-f(alfa)));
                        while abs(f(c))>10^(-12)
                            if f(c)*f(alfa)>0
                                alfa=c;
                            else
                                omega=c;
                            end
                            
                         c= omega-((f(omega)*(omega-alfa))/(f(omega)-f(alfa)));
                        end
                        s=[s,c];
                    end
                    
                    
                end
            end
            
            a=b;
            b=a+h;
        end
        
        s= unique(s);
        fprintf('La raiz o raices de la función son: \n');
        num = numel(s);
        if num==0   
            fprintf('No existe solución dentro del intervalo %5.12f y %5.12f',m,n);
        else
            s
        end
        
        
    end
    
    
    
    
    
    
    q= input('Para repetir pulse (1)\n');
    
end 

fprintf('Gracias por usar\n');
pause(0.5)
clear;
clc;