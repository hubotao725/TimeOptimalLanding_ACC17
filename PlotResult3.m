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
title('Rotation speed','FontSize',FontSize);
xlabel('Time (s)','FontSize',FontSize);
ylabel('Rotation speed (rad/s)','FontSize',FontSize);
xlim([0 (N-1)*Ts]);
ylim([-10 10]);

a=annotation('textarrow',[0.33 0.26],[.64 0.52],'String','t_2');
a.HeadWidth=5;
a.HeadLength=5;
a=annotation('textarrow',[0.4 0.34],[.52 0.42],'String','t_3');
a.HeadWidth=5;
a.HeadLength=5;
a=annotation('textarrow',[0.5 0.48],[.53 0.43],'String','t_4'); 
a.HeadWidth=5;
a.HeadLength=5;
a=annotation('textarrow',[0.85 0.9],[.64 0.54],'String','t_5'); 
a.HeadWidth=5;
a.HeadLength=5;
set(gca,'FontSize',FontSize);
print -dpdf rotationspeed.pdf