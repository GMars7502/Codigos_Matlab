%7)Desarrollar un programa en Matlab, aplicando series, para calcular: 
%Utilizado de referencia: https://www.youtube.com/watch?v=CU_Fcgau5Y 
%canal: Faustinianos

%Autor: restanM
%https://github.com/GMars7502/
q=1;

%sigma

while q==1
    
    %a= 45 y b=50
    
a = input('Ingresar x1 por favor\n');
b = input('Ingresar x2 por favor\n');
    
 if a==b
     fprintf('ERROR\n Deber ingresar un intervalo diferente\n\n');
 else
     if a>b
         c=a;a=b;b=c;
     end
     
     %z= 8 , u = 45
     z=8;
     u=45;
     
     
     p=0;
     for n=0:1:50
         Segunda= ((-1)^n)*[((b-u)^(2*n+1))-((a-u)^(2*n+1))];
         Tercera = 1/((2^n)*(2*n+1)*factorial(n)*(z^(2*n+1)));
         p=p+Segunda*Tercera;
     end
     Primera = 1/sqrt(2*pi);
     
     p=p*Primera;
     
     fprintf('la respuesta de p es: P=%5.12f\n',p);
     fprintf('P = P(%5.12f < %5.12f < %5.12f)\n',a,p,b);
     
 end
    
 
 
 
 
    
    
    q = input('Para repetir pulse(1)\n');
    
end

clc;
fprintf('Gracias por usar\n');
pause(0.5)
clear;
clc;