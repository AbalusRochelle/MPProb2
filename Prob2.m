%'Input matrix in standard MATLAB format: '
Xa=input('Xa coordinate :');
Ya=input('Ya coordinate :');
Xb=input('Xb coordinate :');
Yb=input('Yb coordinate :');
Xc=input('Xc coordinate :');
Yc=input('Yc coordinate :');

%Point A-B
syms x y
if (Xb-Xa)==0
    %Equation
    f1=((Xa + Xb)/2)-x;
    NLm=0;
    
elseif (Xb-Xa)~=0
        NLm= (Xa-Xb)/(Yb-Ya);
        b=((Ya+Yb)/2)-((Xa-Xb)/(Yb-Ya))*((Xa+Xb)/2);
        %equation
        f1=NLm*x + b - y;
end
%Point B-C
if(Xc-Xb)==0
    %equation
    f2=((Xc-Xb)/2)-x;
    NLm=0;
    
elseif (Xc-Xb)~=0
    NLm=(Xb-Xc)/(Yc-Yb);
    b=((Yb+Yc)/2)-((Xb-Xc)/(Yc-Yb))*((Xb+Xc)/2);
    %equation
    f2=NLm*x + b - y;

end
sol=solve([f1,f2],[x,y]);
CenterpointX=sol.x;
CenterpointY=sol.y;
Center=[ CenterpointX CenterpointY]
%RADIUS
RADIUS=sqrt((CenterpointX-Xa)^2 + (CenterpointY-Ya)^2)
%VECTOR [D E F] Formula
%(x-CenterpointX)^2 + (y-CenterpointY)^2 = RADIUS^2
%x^2 -2*CenterpointX*x+ CenterpointX^2 + y^2 -2*CenterpointY*y+CenterpointY^2=RADIUS^2
%x^2 + y^2 + (-2*CenterpointX)x + (-2*CenterpointY)y + (CenterpointX^2 +
%CenterpointY^2 -RADIUS^2)=0
D=-2*CenterpointX ;
E=-2*CenterpointY;
F=- CenterpointX^2 + CenterpointY^2 - RADIUS^2;
VECTOR=[ D E F ]
