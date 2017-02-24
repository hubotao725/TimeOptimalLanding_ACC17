function PlotResult2(pltY,pltZ,pltTheta,N,h,Ts)
%PlotResult this function will plot the result of the velocity
%yres is the result of the optimal solution. It is a matrix.
%zres is the result of the optimal solution. It is a matrix. 
%theta is the result of the solution. It is a matrix. 
%thrust is the thrust vector
%N is the number of the samples
x0=10;
y0=40;
width=270;
height=250;
set(gca,'units','points','position',[x0,y0,width,height]);
LineWidth=1.5;
IMG_WIDTH=8;
IMG_HEIGHT=7;
STEP=15;
 
c=colormap(jet(N));
hold on
for i=1:STEP:N
    DrawQuad2D(pltY(i,1),pltZ(i,1),pltTheta(i,1),c(i,:));
end
for i=1:3*STEP:N
    DrawPlat(-0.3*i*Ts,0,1*sin(i*Ts),'b');
end
plot(pltY(1:N,1),pltZ(1:N,1),'k','LineWidth',1.5);
hold off

axis equal
xlim([-2,2]);
ylim([-0.5,5.5]);
FontSize=14;
xlabel('x position (m)','FontSize',FontSize);
ylabel('z position (m)','FontSize',FontSize);
title('Time optimal maneuver','FontSize',FontSize);

set(h,'paperunits','centimeters');
set(h,'papersize',[IMG_WIDTH IMG_HEIGHT]);
set(h,'paperposition',[0,0,IMG_WIDTH,IMG_HEIGHT]);  
set(gca,'FontSize',FontSize);
c=colorbar;
c.Limits=[0 (N-1)*Ts];
caxis([0 (N-1)*Ts]);
c.Label.String='Time (s)';
c.Label.FontSize=FontSize;

cpos=c.Position;
cpos(4)=0.9*cpos(4);
cpos(3)=0.75*cpos(3);
c.Position = cpos;
c.Position(1)=c.Position(1)+0.1;
print -dpdf trajectory.pdf
print -djpeg trajectory.jpg
end

