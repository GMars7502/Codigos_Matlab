q=1;
while q==1
    
    result = 0;
    fprintf('Ingresar el  indice (2) o (3) para el numero\n');
    ingreso = input('Ingresa: \n');
    switch ingreso
        case 2
            numero = input('Ingresa el numero para sacar raíz cuadrada\n');
            result = raizCuadrada(numero);
            fprintf('la raíz cuadrada de %5.12f es: %5.12f\n',numero,result);
        case 3
            numero = input('Ingresa el numero para sacar raíz cúbica\n');
            result = raizCubica(numero);
            fprintf('la raíz cubica de %5.12f es: %5.12f\n',numero,result);
        otherwise
            fprintf('Deber ingresar uno de los indices disponibles\n')
    end 
    
    
    
   
    q=input('Para repetir pulse (1)\n');
    
end
clc;
fprintf('Gracias por usar \n');
pause(0.5)
clc;

function raiz = raizCuadrada(numero)

x = numero;

x = (x^2+numero)/(2*x);
alfa = inf;

    while abs(x-alfa)>10^-12
        alfa=x;
        x = (x^2+numero)/(2*x);
    end

raiz = x;


end

function raiz = raizCubica(numero)

x = numero;

x = (2*x+numero/(x^2))/3;
alfa = inf;

    while abs(x-alfa)>10^-12
        alfa=x;
        x = (2*x+numero/(x^2))/3;
    end

raiz = x;


end 

