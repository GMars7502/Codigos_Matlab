q=1;

x= sym('x');

while q==1
    %<>
    f = input('Ingrese su función\n','s');
    f= inline(f);
    
    a = input('Ingrese el intervalo inferior\n'); 
    b = input('Ingrese el intervalo superior\n'); 

    
    if a==b
        error('No puede hacer intervalos iguales');
    else
        if a>b
            p=a;a=b;b=p;
        end

       n = 10^4;
        
       h = (b-a)/n;
       x=[];

       for i=a:h:b
        x=[x,i];   
       end
       


    
        integral = f(a)+f(b);
        
        

       for i=1:1:((n/2)-1)
        integral = integral + 2*f(x(i*2+1));
       end
       
       
       for i= 1:1:n/2
           integral= integral + 4*f(x(2*i));
       end
        
       integral = integral * h/3;
       
       fprintf('la solución de la integral es: %5.12f \n',integral);

    



    end







    q = input('Para repetir pulse (1)\n');

end


fprintf('Gracias por usar\n');
pause(0.5)

