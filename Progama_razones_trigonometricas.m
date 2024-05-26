% HECHO POR GATOVOLADOR | GMars7502
% En este codigo se ultiriza la sumatoria de taylor en el seno y coseno, de estos se saca las demas razones trigonometricas
% Lineas para ver grafica del seno, con la sucession de taylor()(para ejecutar en el command window)
% x = linspace(0,2*pi,1000);
% 
%  PREFORMATTED
%  TEXT
% 
% y=x-(1/factorial(3))*(x.^3)+(1/factorial(5))*(x.^5)-(1/factorial(7))*(x.^7)+(1/factorial(9))*(x.^9)-(1/factorial(11))*(x.^11)+(1/factorial(13))*(x.^13)-(1/factorial(15))*(x.^15);plot(x,y,'b','linewidth',1)


%*Realizar el coseno y seno , y de ello sacar las otras razones
%trigonometricas
%
%*



x=sym('x');

Q=1;
y=0;
Desicion=0;
fprintf('Bienvenido\n');


while Q==1
    
    Q=1;
    result = 0;
    result1 = 0;
    result2 = 0;
    fprintf('**************************************************************************\n');
    fprintf('** Ingrese la razón trigonométrica que quiere ultirizar                 **\n');
    fprintf('**                                                                      **\n');
    fprintf('** 1) Seno                             Recuerde que solo debes ingresar **\n');
    fprintf('** 2) Coseno                           valores numericos                **\n');
    fprintf('** 3) Tagente                                                           **\n');
    fprintf('** 4) Cotagente                                                         **\n');
    fprintf('** 5) Cosecante                                                         **\n');
    fprintf('** 6) Secante                                                           **\n');
    fprintf('** 7) Salir (cualquier tecla)                                           **\n');
    fprintf('**************************************************************************\n');
Desicion = input('Inserta numero: ');
    fprintf('\n\n');
    clc;
    
    switch Desicion
        case 1
             Q=2;
            while Q==2
            fprintf('Ingresado al seno \n');
            x=IngresarDatoAngulo();
            fprintf('el dato ingresado es: %f\n',x);
            y=x;
            result = realizarseno(x);
            
            fprintf('el valor calculador de sen es %f\n',result);
            
            fprintf('Comprobación con el dato sen() de Matlab');
            sin(y)
            fprintf('\n\n');
            fprintf('Para repetir la razon trigonometrica pulse (2),\n')
            Q=input('para volver al menú pulse (1) y para salir pulse cualquier tecla.\n');
            clc;
            end
            clc;
        case 2
             Q=2;
            while Q==2
            fprintf('Ingresado al coseno \n');
            x=IngresarDatoAngulo();
            fprintf('el dato ingresado es: %f\n',x);
            y=x;
            
            result = realizarCoseno(x);
            
            fprintf('el valor calculador de cos es %f\n',result);
             fprintf('Comprobación con el dato cos() de Matlab');
            cos(y)
            fprintf('\n\n');
            fprintf('Para repetir la razon trigonometrica pulse (2),\n')
            Q=input('para volver al menú pulse (1) y para salir pulse cualquier tecla.\n');
            clc;
            end
            clc;
        case 3
            Q=2;
            while Q==2
            fprintf('Ingresado al tangente \n');
            
            x=IngresarDatoAngulo();
            fprintf('el dato ingresado es: %f\n',x);
            y=x;
            
            result1 = realizarCoseno(x);
            result2 = realizarseno(x);
            fprintf('el valor seno %f\n',result2);
            fprintf('el valor cos  %f\n',result1);
            result = (result2)/(result1);
            fprintf('el valor calculador de tan es %f\n',result);
             fprintf('Comprobación con el dato tan() de Matlab');
            tan(y)
            fprintf('\n\n');
            
            fprintf('Para repetir la razon trigonometrica pulse (2),\n')
            Q=input('para volver al menú pulse (1) y para salir pulse cualquier tecla.\n');
            clc;
            end
            clc;
            
        case 4
            Q=2;
            while Q==2
            fprintf('Ingresado al cotagente \n');
            x=IngresarDatoAngulo();
            fprintf('el dato ingresado es: %f\n',x);
            y=x;
            
            result1 = realizarCoseno(x);
            result2 = realizarseno(x);
            result = result1/result2;
            
            fprintf('el valor seno %f\n',result2);
            fprintf('el valor cos  %f\n',result1);
            
            fprintf('el valor calculador de ctan es %f\n',result);
             fprintf('Comprobación con el dato ctg() de Matlab');
            cot(y)
            fprintf('\n\n');
            fprintf('Para repetir la razon trigonometrica pulse (2),\n')
            Q=input('para volver al menú pulse (1) y para salir pulse cualquier tecla.\n');
            clc;
            end
            clc;
        case 5
            %1/sen
             Q=2;
            while Q==2
            fprintf('Ingresado al cosecante \n');
            x=IngresarDatoAngulo();
            fprintf('el dato ingresado es: %f\n',x);
            y=x;
            
            result = 1/realizarseno(x);
            
            fprintf('el valor calculador de csc es %f\n',result);
             fprintf('Comprobación con el dato csc() de Matlab');
            csc(y)
            fprintf('\n\n');
            
            fprintf('Para repetir la razon trigonometrica pulse (2),\n')
            Q=input('para volver al menú pulse (1) y para salir pulse cualquier tecla.\n');
            clc;
            end
            clc;
            
        case 6
            Q=2;
            while Q==2
            fprintf('Ingresado al secante \n'); 
            x=IngresarDatoAngulo();
            fprintf('el dato ingresado es: %f\n',x);
            y=x;
            
            result = 1/realizarCoseno(x);
            
            fprintf('el valor calculador de sec es %f\n',result);
             fprintf('Comprobación con el dato sec() de Matlab');
            sec(y)
            fprintf('\n\n');
            
            fprintf('Para repetir la razon trigonometrica pulse (2),\n')
            Q=input('para volver al menú pulse (1) y para salir pulse cualquier tecla.\n');
            clc;
            end
            clc;
        otherwise
            Q=Q-1;

    end
    
    
    
   
    
    
       
    
    
end



fprintf('****************************************************\n\n');
fprintf('Gracias por usar, esperamos verte pronto ;-)\n');
fprintf('Hecho por GMars7502  - github;-)\n\n');
fprintf('****************************************************\n');
pause(3)
clear;
clc;


%------------------------------------------end program----------------------------------------------------------





%|||||||||||||||||||||||||||||||||||||||||||Funciones|||||||||||||||||||||||||||||||||||||||||||||||||||||||


%||||||||||||||||Funcion de ingreso de dato angulo||||||||||||||||||||||||
function z = IngresarDatoAngulo()

x=0;
p=1;
while p==1

    fprintf(' Dime a que sistema deseas 1)Radial o 2)Sexagesimal   ~)Recuerde que solo debes ingresar   \n');
    fprintf('                                                        valores numericos                  \n');

dato = input('\n\n');
     
switch dato
    case 1
        x=input('Ingrese el ángulo en radianes \n');
    
        p=p-1;
    case 2
        x=input('Ingrese el ángulo en sexagesimales \n');
        x= x*(pi/180);
        p=p-1;
    otherwise
        fprintf('!!!!!!!!!!!!ERROR_SISTEMA!!!!!!!!!!!!!!!!\n');
        fprintf('Deber de elegir un sistema 1) O 2)\n\n');
        pause(4)
        clc;
end %end de switch



end %end de while

z=x;
clc;
end
%||||||||||||||||||||||||Funcion de seno||||||||||||||||||||||||||||
function s = realizarseno(x)
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
        s=s+((-1)^(i+1))*(x^(2*i-1))/factorial(2*i-1);
    end
   
    
    
 
end
%||||||||||||||||Funcion de conseno||||||||||||||||||||||||
function c= realizarCoseno(x)

if x>=(2*pi)
        x=mod(x,(2*pi));
    
    
    else
        if x<= -(2*pi)
            x=abs(x);
            x=mod(x,(2*pi));
            x=-x;
        end
end

    c=0;
    for i=1:1:17
        c=c+(((-1)^(i+1))*(x^(2*i-2)))/factorial(2*i-2);
    end
   
   
    
    
    
end    
    
    
    
    
