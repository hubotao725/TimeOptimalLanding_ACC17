function PlotClosePic(pltY,pltZ,pltTheta,N,Ts,h)
%PlotResult this function will plot the result of the velocity
%yres is the result of the optimal solution. It is a matrix.
%zres is the result of the optimal solution. It is a matrix. 
%theta is the result of the solution. It is a matrix. 
%thrust is the thrust vector
%N is the number of the samples

LineWidth=1.5;
IMG_WIDTH=7;
IMG_HEIGHT=6;
lastStep=1;
filename='horizontal6.gif';
cl=colormap(jet(N));
step=1;

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

cpos(3)=0.75*cpos(3);
c.Position = cpos;
 
for i=N-20*step:step:N
     
   
     
    hold on;
    curStep=floor(10);
    plot(pltY(1:i,1),pltZ(1:i,1),'r');
    DrawQuad2D(pltY(i,1),pltZ(i,1),pltTheta(i,1),cl(i,:));
    DrawPlat(-0.3*i*Ts,0,1*sin(i*Ts),'b');
%     for j=1:curStep:i
%         DrawQuad2D(pltY(j,1),pltZ(j,1),pltTheta(j,1),cl(j,:));
%     end
    axis equal 
    hold off;
    xlim([-.5,.5]);
    ylim([0.7,1.6]);
 
    pause(1);
end 
end
