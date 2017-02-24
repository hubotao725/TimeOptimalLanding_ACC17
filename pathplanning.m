%Path following solver
clear all;
close all;
addpath('G:\Downloads\casadi-matlabR2014a-v2.4.1-Debug');
addpath('C:\Users\hubot\Downloads\casadi-matlabR2014a-v2.4.1-Debug');
addpath('/home/botao/Downloads/casadi-matlabR2014a-v2.4.1');
import casadi.*

N=201;
b=SX.sym('b',8*N+1,1);
s=SX.sym('s',N,1);
maxS=1;


[f]=CostFun(b,N);

[y,z,theta]=GetDerivative(b,N);

g=ConstrFun(y,z,theta,b,N);

nlp=SXFunction('nlp',nlpIn('x',b),nlpOut('f',f,'g',g));
solver=NlpSolver('solver','ipopt',nlp);

arg=struct;
arg=InitArg(arg,N);
res=solver(arg);
f_opt=full(res.f);
x_opt=full(res.x);
lam_x_opt=full(res.lam_x);
lam_g_opt=full(res.lam_g);
%[F_T,F_W]=GetInput(x_opt,N);
 [pltY,pltZ,pltTheta]=GetQuadState(y,z,theta,b,x_opt);
 h=figure(1);
 
LineWidth=1.5;
IMG_WIDTH=9;
IMG_HEIGHT=5;
FontSize=9;
step=1;
Ts=f_opt/(N-1);
F_t=full(res.g(5*N-4:6*N-5));
plot(Ts*(1:step:N),F_t(1:N),'r','LineWidth',LineWidth);
xlabel('Time (s)');
ylabel('Control input (N/kg)');
title('Control input u_1 with respect to time');
set(h,'paperunits','centimeters');
set(h,'papersize',[IMG_WIDTH IMG_HEIGHT]);
set(h,'paperposition',[0,0,IMG_WIDTH,IMG_HEIGHT]);
xlim([0 5]);
ylim([0 5]);
set(gca,'FontSize',FontSize);
print -dpdf maneuver.pdf


h=figure(3);

LineWidth=1.5;
IMG_WIDTH=8;
IMG_HEIGHT=7;
FontSize=9;
step=1;
x0=70;
y0=40;
width=270;
height=250;
set(gca,'units','points','position',[x0,y0,width,height]);
Ts=f_opt/(N-1);
F_t=full(res.g(5*N-4:6*N-5));
set(h,'paperunits','centimeters');
set(h,'papersize',[IMG_WIDTH IMG_HEIGHT]);
set(h,'paperposition',[0,0,IMG_WIDTH,IMG_HEIGHT]);
[hAx,hy1,hy2]=plotyy(Ts*(1:step:N),F_t(1:N),Ts*(1:step:N),pltTheta(1:N,2));
xlabel('Time (s)');
ylabel('Control input (N/kg)');
title('Control input u_1, u_2 with respect to time');
hy1.LineStyle='--';
hy1.LineWidth=LineWidth;
hy2.LineWidth=LineWidth; 
 
set(hAx(1),'YTick',[0 5 10 15 20]);
set(hAx(2),'YTick',[-10 -5 0 5 10]); 

ylabel(hAx(1),'control input u_1 (N)','FontSize',FontSize);
ylabel(hAx(2),'control input u_2 (rad/s)','FontSize',FontSize);
h2=legend('u_1','u_2','Location','best');
pos=get(h2,'Position');
set(h2,'Position',pos+[-0.10 +0.02 0 0]);
 
xlabh=get(gca,'XLabel');
set(xlabh,'Position',get(xlabh,'Position')+[0 0.05 0]);
set(gca,'FontSize',FontSize);
print -dpdf thrustinput.pdf
figure(4);
plot(pltY(1:N,1),pltZ(1:N,1));
title('thrust  time optimal');
figure(5);
plot(1:N,pltTheta(1:N));
h=figure(6);
PlotResult2(pltY,pltZ,pltTheta,N,h,f_opt/(N-1));
h2=figure(7);
PlotResult3(pltY,pltZ,pltTheta,N,h2,f_opt/(N-1));

h3=figure(8);
PlotGif(pltY,pltZ,pltTheta,N,Ts,h3);

h4=figure(9);
PlotCloseGif(pltY,pltZ,pltTheta,N,Ts,h4);

h5=figure(10);
 
PlotClosePic(pltY,pltZ,pltTheta,N,Ts,h5);
gres=CollisionCheck(pltY,pltZ,pltTheta,f_opt/(N-1),N);