Q=1;


while Q==1
   
   fprintf('Mestod Busca - biseccion\n');
    
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
       
       if f(a) == 0 % el error estaria en que cuando empieza el programa
                    % f(a) seria 0.
           fprintf('la solucion es el valor %5.12f \n',a);
       
       else
                   if f(a)*f(b)==0
                       fprintf('la solucion es el valor %5.12f \n',b);
                   else
                        if b>n

                        fprintf('No existe la solucion entre %5.12f y %5.12f\n',m,n);
                        else
                        fprintf('Existe la solucion entre %5.12f y %5.12f \n',a,b);
                        c=(a+b)/2;n=1;
                        while abs(f(c))>10^(-15)
                            if f(a)*f(c)>0
                                a=c;
                            else
                                b=c;
                            end
                            c=(a+b)/2;n = n +1;
                        end
                        fprintf('La solucion es %5.12f \n',c);
                        fprintf('La solucion es %d \n',n);
                        end
                   end
       end %end del if f(a)==0 
   end
    Q=input('Para continuar pulse 1\n Para salir pulse cualquier tecla\n');
   clc;
   
   
end