function g=ConstrFun(y,z,theta,b,N)
%ConstrFun this is the function that generate the constraint
%b is the state
%g is the constraint
addpath('G:\Downloads\casadi-matlabR2014a-v2.4.1-Debug');
import casadi.*
GRAVITY=9.81;
g=SX(9*N+6,1);

q=b(3*N+1:6*N);
p=b(6*N+1:8*N);
Ts=b(8*N+1)/(N-1);
g(1:N-1)=b(2:N)-b(1:N-1)-Ts*(b(N+1:2*N-1))-Ts^2*(b(5*N+1:6*N-1))/2;
g(N:2*N-2)=b(N+2:2*N)-b(N+1:2*N-1)-Ts*(b(5*N+1:6*N-1));
g(2*N-1:3*N-3)=b(2*N+2:3*N)-b(2*N+1:3*N-1)-Ts*(b(3*N+1:4*N-1))-Ts^2*(b(6*N+1:7*N-1))/2;
g(3*N-2:4*N-4)=b(3*N+2:4*N)-b(3*N+1:4*N-1)-Ts*(b(6*N+1:7*N-1));
g(4*N-3:5*N-5)=b(4*N+2:5*N)-b(4*N+1:5*N-1)-Ts*(b(7*N+1:8*N-1));
g(5*N-4:6*N-5)=sin(theta(1:N,1)).*y(1:N,3)+cos(theta(1:N,1)).*(z(1:N,3)+GRAVITY);
g(6*N-4:7*N-5)=cos(theta(1:N,1)).*y(1:N,3)-sin(theta(1:N,1)).*(z(1:N,3)+GRAVITY);
g(7*N-4:8*N-5)=-(y(1:N,1)+0.25*cos(theta(1:N,1))-5-Ts*(0:N-1)').*tan(0.3*Ts*(0:N-1)')+(z(1:N,1)-0.25*sin(theta(1:N,1)));
g(8*N-4:9*N-5)=-(y(1:N,1)-0.25*cos(theta(1:N,1))-5-Ts*(0:N-1)').*tan(0.3*Ts*(0:N-1)')+(z(1:N,1)+0.25*sin(theta(1:N,1)));
g(9*N-4)=y(1,1);
g(9*N-3)=y(N,1)-5-b(8*N+1)-.25*cos(0.3*b(8*N+1));
g(9*N-2)=y(1,2);
g(9*N-1)=y(N,2)-1;
g(9*N)=z(1,1)-5;
g(9*N+1)=z(N,1)-.25*sin(0.3*b(8*N+1));
g(9*N+2)=z(1,2);
g(9*N+3)=z(N,2); 
g(9*N+4)=theta(1,1);
g(9*N+5)=theta(N,1)+0.3*b(8*N+1);
g(9*N+6)=b(8*N)+.3;
end    


    