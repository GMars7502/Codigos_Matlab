q=1;
x=sym('x');
while q==1
    
    s=[];
    fprintf('Metodo - Punto fijo\n');
    f = input('Ingrese su función\n');
    f= inline(f);
    m =input('Ingrese el intervalo izquierdo\n'); 
    n = input('Ingrese el intervalo derecho\n');
    h = input('Ingrese el incremento\n');
    
    if m==n
        error('LOS INTERVALOS SON IGUALES!!');
        
    else
        
        if m>n
           r=m;m=n;n=r; 
        end
        
        s = metodoPuntoFijo(m,n,h,f);
        s = unique(s);
        tamano = numel(s);
        
        if tamano>0
            fprintf('La raiz o raices de la función ingresada son\n');
            disp(s)
        else
            fprintf('No hubo soluciones encontradas dentro del intervalo %5.12f y %5.12f\n',m,n);
        end
        
        
    end
    
    
    
    
    
    
    
    q=input('Para repetir pulse (1)\n');
end



function s = metodoPuntoFijo(m,n,h,f)
s=[];
a= m;
b= a+h;

    while b<=n
        
        alfa  = a;
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
                    fprintf('Se encontró una solución dentro del intervalo %5.12f y %5.12f',alfa,omega);
                    fprintf('Ingrese la funcion f en forma g(x)=x\n');
                    disp(f)
                    g = input('Ingrese g(x)\n','s');
                    g = inline(g);
                    gp= input('Ingrese la derivada de g(x)\n','s');
                    gp= inline(gp);
                    while ~(abs(gp(alfa))<1 || abs(gp(omega))<1)
                        fprintf('La g(x) anterior ingresada no es convergente y/o la derivada no es correcta\nIngrese otro g(x)\n')
                        fprintf('Ingrese la funcion f en forma g(x)=x\n');
                        disp(f)
                        g = input('Ingrese g(x)\n','s');
                        g = inline(g);
                        gp= input('Ingrese la derivada de g(x)\n','s');
                        gp= inline(gp);
                    end
                    
                    if abs(gp(alfa))<1
                        t=1;
                        if alfa<0
                            t = -1;
                        end
                        
                        while abs(alfa - g(alfa))>10^(-12)
                            alfa = g(alfa);
                        end
                        alfa = alfa * t;
                        s=[s,alfa];
                    else
                        t=1;
                        if omega<0
                            t = -1;
                        end
                        
                        while abs(omega - g(omega))>10^(-12)
                            omega = g(omega);
                        end
                        omega = omega * t;
                        s=[s,omega];
                    end
                    
                    
                end
                
            end
        end
        
        
        
    a=b;
    b=a+h;
        
    
    end








end