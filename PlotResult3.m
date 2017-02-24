function PlotResult3(pltY,pltZ,pltTheta,N,h,Ts)
%PlotResult this function will plot the result
%pltY is the y position.
%pltZ is the z position
%pltTheta is the angle
%N is the number of states
%h is the figure handle
%Ts is the sampling time
step=1;
LineWidth=1.5;
IMG_WIDTH=9;
IMG_HEIGHT=5;
FontSize=7;
set(h,'paperunits','centimeters');
set(h,'papersize',[IMG_WIDTH IMG_HEIGHT]);
set(h,'paperposition',[0,0,IMG_WIDTH,IMG_HEIGHT]);
plot(Ts*(1:step:N),pltTheta(1:step:N,2),'r','LineWidth',LineWidth);
title('Control input 2','FontSize',FontSize);
xlabel('Time (s)','FontSize',FontSize);
ylabel('Rotation speed (rad/s)','FontSize',FontSize);
xlim([0 (N-1)*Ts]);
ylim([-10 10]);
a=annotation('textarrow',[.9/3.54 1.1/3.54-0.007],[.49/1.93 .29/1.93+0.01],'String','t_2');
a.HeadLength=5;
a.HeadWidth=5;
a=annotation('textarrow',[1.67/3.54 1.87/3.54-0.01],[.94/1.93 .74/1.93],'String','t_5');
a.HeadLength=5;
a.HeadWidth=5;
a=annotation('textarrow',[2.97/3.54 3.17/3.54-0.01],[1.2/1.93 1/1.93+0.02],'String','t_6');
a.HeadLength=5;
a.HeadWidth=5;
set(gca,'FontSize',FontSize);
print -dpdf rotationspeed.pdf