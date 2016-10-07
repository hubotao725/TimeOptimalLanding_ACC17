function g=CollisionCheck(x,z,theta,Ts,N)
%CollisionCheck this function will check the collision condition
%x_opt is the optimal result
%N is the number of states
g=zeros(2*N,1);
r=0.25;
px1=x(1:N,1)+r*cos(theta(1:N,1));
py1=z(1:N,1)-r*sin(theta(1:N,1));

px2=x(1:N,1)-r*cos(theta(1:N,1));
py2=z(1:N,1)+r*sin(theta(1:N,1));



qx=0*ones(N,1);
qy=.1*sin(Ts*(0:N-1))';

g(1:N,1)=-(px1-qx).*tan(0.3*Ts*(0:N-1)')+(py1-qy);
g(N+1:2*N,1)=-(px2-qx).*tan(0.3*Ts*(0:N-1)')+(py2-qy);
end
