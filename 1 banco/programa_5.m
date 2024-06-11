%{

intentar hacer un programa en que no se ingrese intervalos

los intervalos progresivos


empezar desde a -- b

despues 

c--- a    b---d 
(los espacios entre a y b son zonas ya buscandas, no se vuelve a ver)
depues 


f---c  a  b  d ---- g


osea buscar por zonas 

            a----b
    c-------a    b------d 
f---c       a    b      d------g

solucion

---nididea

a----b
b------d -> por (-) ----> -d ------- -b


||||||||||||||
|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
otro problema 


cuando deber termina el algoritmo?

se puede agregar un estado en que si se encuentra una solución
se busque una vez mas para la siguiente vez, si encuentra se buscar otra vez
pero si no encuentra nada mas, se termina el programa 


solucion

realizar una variable de estado en que si esta con cierto valor, var ser la
siguiente va ser la ultima busqueda, pero si encuentra, regresar al valor
de ulitma busqueda 


i=1

while i mayor igual a 0
if ---encontro solucio---

i=i-1;

else

i=1

end

end

otra manera más precisa

cada vez que la función caiga o esté acercandose a eje de las arbcisas,
este continuara, pero sin la función están alejandose, este van
detenierdose
a= inferior
b=superior
abs(f(a))>abs(f(b))


%}



q = 1;

while q == 1
    x = sym('x');  % Definir la variable simbólica x

    f_input = input('Ingrese la ecuación: \n');  % Leer la función como cadena de texto
    f = inline(f_input);  % Convertir la cadena en una función inline

    m = -10;
    n = 10;

    v = [];

    s = EntregarVector(f, m, n);
    v = [v, s];

    final = 1;
    Nfinal= 1;
    i=0;
    while final >= 0 || Nfinal>= 0 && i<=10^4
        tamanoVector = numel(v);
        s = [];
        Is = [];

        % Intervalos de búsqueda progresiva
        m = n;
        n = n + 10;
        
        
        Im = -m;
        In = -n;
        
        if Nfinal>-100
        Is = EntregarVector(f, Im, In);
        v = [v, Is];
        end
        
        if final>-100
        s = EntregarVector(f, m, n);
        v = [v, s];
        end

        tamanoActual = numel(v);

        % Verificar cambios en la pendiente
        if tamanoVector < tamanoActual
            final = final + 2;
            Nfinal = Nfinal + 2;
        else
            
            final = final + EntregarDiferenciaPendientes(m, n, f);
            Nfinal = Nfinal + EntregarDiferenciaPendientes(Im, In, f);
               
        end
        i=i+1;
    end

    fprintf('La raíz o raíces de la función son: \n');
    v = unique(v);
    disp(v);

    q = input('Para repetir pulse (1)\n');
end

fprintf('Gracias por usar\n');
pause(0.5);

%||||||||||||||||||||||||||||||||funcion principal|||||||||||||||||||||||||

function t = EntregarDiferenciaPendientes(c, d,f)
    
    a= c;
    b= d;
    
    %b=70 a=60
    if abs(f(a))>abs(f(b))
        t=3;
    else
        if abs(f(a))-abs(f(b))==0
        t=-3;
        else
            if abs(f(a))<abs(f(b))
              t=-1;
            else
                t=-2;
            end
        end
    end
    
end

function s = EntregarVector(f, m, n)
    
    if m>n
        p=m;m=n;n=p;
    end


    s = [];
    a = m;
    b = a + 1;

    while b <= n
        alfa = a;
        omega = b;
        
        if f(alfa) == 0
            s = [s, alfa];
        else
            if f(alfa) * f(omega) == 0
                s = [s, omega];
            else
               
                if  f(alfa) * f(omega) > 0
                    %nada
                else
                     % Método de bisección
                    c = (alfa + omega) / 2;
                    while abs(f(c)) > 10^(-12)
                    if f(alfa) * f(c) > 0
                        alfa = c;
                    else
                        omega = c;
                    end
                    c = (alfa + omega) / 2;
                    end
                    s = [s, c];

                end
                
            end
        end

        a = b;
        b = b + 1; % Incremento lineal
    end
end
