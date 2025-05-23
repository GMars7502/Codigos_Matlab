q=1;
x=sym('x');

while q==1
    
    fp = input('ingresar su función\n');
    fderivativa1 = abs(fp);
    fderivativa2 = inline(fderivativa1);
    f = inline(fp);
    derivada = diff(fderivativa1);
    derivada = inline(derivada);
    v=[];
    s=[];
    m= -10; 
    n= 10;
    
    s= MetodoBiseccion(m,n,f);
    v =[v,s];
    
    finalN = 1;
    final = 1;
    
    i=0;
    while (finalN>0 || final>0) && i<1000
        s=[];
        Is=[];
        

        m = n;
        n = n+100;
        fprintf("####################################################\n");
        fprintf("Interacción N°%f:\n",i);
        fprintf("$$Lado positivo entre intervalos: "+m+" y "+n+"\n");
        Im = -m;
        In = -n;
        fprintf("$$Lado negativo entre intervalos: "+Im+ " y "+In+"\n");
        fprintf("####################################################\n");
        s = MetodoBiseccion(m,n,f);
        v=[v,s];
        
        Is= MetodoBiseccion(Im,In,f);
        v=[v,Is];
        
        
       
        final = final + crecimiento(m,n,fderivativa2,derivada,1);
        finalN = finalN + crecimiento(Im,In,fderivativa2,derivada,0);
        i= i +1;
    end
    
    v= unique(v);
    
    tamano= numel(v);
    
    if tamano>0
        disp(v)
    else
        fprintf('No se encontro nada\n');
    end
    
    
    
    
    
    
    
    q=input('Para repetir pulse (1)\n');
end


function t = crecimiento(m,n,f,derivada,lado)
  

    if abs(f(m))>abs(f(n))
        t=0.5;
    else
        
        fprintf("||||||||||||||||||||||||||||||||||||||||||||||||||||||||||\n");
        fprintf("Entrando a la función crecimiento\n");
        if lado==1
            fprintf("Lado positivo\n");
        else
            fprintf("Lado negativo\n");
        end
        Mp = derivada(m);
        Np = derivada(n);
        fprintf("En los puntos de la y: m es "+f(m)+", n es "+f(n)+"\n" );
        fprintf("Las siguientes son derivadas m y n:\n");
        fprintf("m: %f\n", Mp); % Imprimir el valor de m
        fprintf("n: %f\n", Np);

        if abs(Mp-Np)<1e-15
            
            Mp =Np;
            fprintf("Son iguales las derivadas\n");

        end
          
        if abs(Mp)>abs(Np)
            t=0.5;
            fprintf("Seguir buscando, bajada de derivada\n");
            fprintf("||||||||||||||||||||||||||||||||||||||||||||||||||||||||||\n");
        else
            
            id=0;
            while (abs(Mp)<abs(Np)) && id<500
                
                if m<0 && n<0
                    m = n;
                    n = n -10;
                else
                    m = n;
                    n = n + 10;
                end
             
               id = id +1;
            end
            
            if id<500
                t=0.5;
            fprintf("Seguir buscando por aproximida de bajada de derivada\n");
            fprintf("||||||||||||||||||||||||||||||||||||||||||||||||||||||||||\n");
            else
                t=-1;
            fprintf("No hay bajada de derivada aproximada\n");
            fprintf("||||||||||||||||||||||||||||||||||||||||||||||||||||||||||\n");
            end
               
        end  

    end
    
end







function s = MetodoBiseccion(m,n,f)

if m>n
    r=m;m=n;n=r;
end

s=[];
a = m;
b= a + 1;

while b<=n
    
    alpha = a;
    omega = b;
    
    if f(alpha)==0
        s=[s,alpha];
    else
        if f(alpha)*f(omega)==0
            s=[s,omega];
        else
            if f(alpha)*f(omega)>0
                %nada
            else
                c = (alpha+omega)/2;
                while abs(f(c))>10^-12
                    if f(alpha)*f(c)>0
                        alpha=c;
                    else
                        omega=c;
                    end
                c = (alpha+omega)/2; 
                end
                s=[s,c];
                
            end
        end
    end
    
    a= b;
    b=a+1;
    
end



end














