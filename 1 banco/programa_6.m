%{
 Desarrollar un programa en Matlab para calcular los valores 
numéricos de la funciones trigonométricas de los ángulos en 
sexagesimales, radianes o centesimales. 
 Entrada: valor del ángulo en sexagesimal, radián o centesimal 
Salida: Valor numérico de la función trigonométrica del valor del 
ángulo 

%}


q=1;

while q==1
    
    quest = input('A que sistema quiere ingresar sus grados:pulse \n(1)Radial\n(2)Sexagesimal\n(3)Centesimal\n');
    
    
    switch quest
        case 1
            x = input('Ingrese el grado en radial\n');
            ObtenerFunciones(x);
            
        case 2
            x = input('Ingrese el grado en Sexagesimal\n');
            x = (x * pi)/180;
            ObtenerFunciones(x);
            
        case 3
            x = input('Ingrese el grado en Centesimal\n');
            x = (x * pi)/200;
            ObtenerFunciones(x);
        otherwise
            fprintf('ERROR\nDEBER INGRESAR UN SISTEMA!\n');
    end
    
    
    
   
    q= input('Para repetir pulse (1)\n');
    
end

clc;
fprintf('Gracias por usar\n');
pause(0.5)
clear;
clc;

%-----------------------------------Funciones-------------------------------------------

function s = ObtenerSeno(x)

if x>=(2*pi)
    x = mod(x,2*pi);
else
    if x<=(-2*pi)
        x=abs(x);
        x= mod(x,2*pi);
        x=-x;
    end
end

    s=0;
    for i=1:1:17
    s= s+ (((-1)^(i+1))*(x^(2*i-1)))/(factorial(2*i-1));
    end
    if s == -0
        s= -s;
    end

    if abs(s) <=10^(-15)
        s= 0;
    end

end

function c = ObtenerCoseno(x)

if x>=(2*pi)
    x = mod(x,2*pi);
else
    if x<=(-2*pi)
        x=abs(x);
        x= mod(x,2*pi);
        x=-x;
    end
end

    c=0;
    for i=1:1:17
    c= c+ (((-1)^(i+1))*(x^(2*i-2)))/(factorial(2*i-2));
    end

    if c == -0
        c= -c;
    end
    
    if abs(c) <=10^(-15)
        c= 0;
    end


end


function t = ObtenerTan(x)
seno = ObtenerSeno(x);
coseno = ObtenerCoseno(x);

    if coseno == 0
        t = Inf;
    else
        t = seno/coseno;
        
    end



end


function ObtenerFunciones(x)





seno = ObtenerSeno(x);
coseno = ObtenerCoseno(x);
ttan = ObtenerTan(x);

cctg = 1/ttan;
ssec = 1/coseno;
ccsc = 1/seno;
fprintf('Que función trigonometrica quieres? \n');
fprintf('1) Seno\n');
fprintf('2) Coseno\n');
fprintf('3) Tagente\n');

fprintf('4) Cotagente\n');
fprintf('5) Secante\n');
fprintf('6) Cotagente\n');



option= input('ingrese funcion: \n');

switch option
    case 1
        fprintf('Seno: %5.2f\n',seno);
    case 2
        fprintf('Coseno: %5.2f\n',coseno);
    case 3
        fprintf('tagente: %5.2f\n',ttan);
    case 4
        fprintf('Cotagente: %5.2f\n',cctg);
    case 5
        fprintf('Secante: %5.2f\n',ssec);
    case 6
        fprintf('Cosecante: %5.2f\n',ccsc);
    otherwise
        fprintf('Deber elegir uno de las funciones\n');
       
end













end 