Q=1;


while Q==1
   
   fprintf('Mestod busca - PUNTO FIJO\n');
    
   %aqui se simboliza la x 
   x=sym('x');
   
   
   f = input('Ingrese la ecuacion\n');
   %aqui se convierte la ecuacion a formato
   f = inline(f);
   
   %aqui se esta ingresado el intervalo para encontrar el grafico
   fprintf('Ingrese su intervalo\n');
   
   
   m = input('Ingre. intervalo izquierdo\n');
   n = input('Ingre. intervalo derecho\n');
   
   if m==n
       fprintf('Error \n');
   else
      
       if m>n
           t=m;m=n;n=t;
       end
       
       h= input('ingrese incremento\n');
       a=m;b=a+h;
       while f(a)*f(b)>0 && b<=n
           a=b;b=a+h;
       end
       
       if f(a)*f(b)==0
           fprintf('la solucion es el valor %5.12f \n',b);
       else
            if b>n
                
            fprintf('No existe la solucion entre %5.12f y %5.12f\n',m,n);
            else
            fprintf('Existe la solucion entre %5.12f y %5.12f \n',a,b);
            f,   %la coma hacer que muestre su valor
            fprintf('Exprese f como x=g(x \n');
            g = input('Ingrese g(x) \n');
            g=inline(g);
            g1=input('Ingrese la derivada de g(x) \n');
            g1=inline(g1);
            
            while ~(abs(g1(a))<1 | abs(g1(b))<1)
                fprinf('g(x) no cumple con el criterio de convergencia \n');
                fprintf('Exprese f como x=g(x \n');
                g = input('Ingrese otro g(x) \n');
                g=inline(g);
                g1=input('Ingrese otra derivada de g(x) \n');
                g1=inline(g1);
                
            end
            
            if abs(g1(a))<1
                
                while abs(a-g(a))>10^-12
                    a=g(a);
                end
            else
                while abs(a-g(a))>10^-12
                    b=g(b);
                    a=b;
                end
            end
            
            fprintf('la respuesta con el punto fijo es %5.12f \n',a);
            
            end
       end
   end
    Q=input('Para continuar pulse 1\n Para salir pulse cualquier tecla\n');
   clc;
   
   
end