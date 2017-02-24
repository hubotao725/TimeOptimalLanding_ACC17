function PlotGif(pltY,pltZ,pltTheta,N,Ts,h)
%PlotResult this function will plot the result of the velocity
%yres is the result of the optimal solution. It is a matrix.
%zres is the result of the optimal solution. It is a matrix.
%theta is the result of the solution. It is a matrix.
%thrust is the thrust vector
%N is the number of the samples
IMG_WIDTH=7;
IMG_HEIGHT=7;
lastStep=1;
filename='horizontal6.gif';
cl=colormap(jet(N));
step=5;
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
cpos(3)=.25*cpos(3);
cpos(4)=0.5*cpos(4);
cpos(2)=cpos(2)+0.2;
c.Position=cpos;
    xlim([-1,10]);
    ylim([-0.5,5.5]);
    
ax = gca;
axpos = ax.Position;
ax.Position = axpos+[0 0.05 0 0];
v=VideoWriter('horizontalLanding.avi');
open(v);
for i=1:step:N
    
    cla(h);
    

    hold on;
    curStep=floor(10);
    plot(pltY(1:i,1),pltZ(1:i,1),'r');
    DrawQuad2D(pltY(i,1),pltZ(i,1),pltTheta(i,1),cl(i,:));
    DrawPlat(-0.3*i*Ts,5+i*Ts,0,'b');
    for j=1:curStep:i
        DrawQuad2D(pltY(j,1),pltZ(j,1),pltTheta(j,1),cl(j,:));
    end
    
    axis equal
    hold off;
    xlim([-1,10]);
    ylim([-0.5,5.5]);
    
    frame=getframe(gcf);
    im=frame2im(frame);
    [imind,cm]=rgb2ind(im,256);
    if i==1
        imwrite(imind,cm,filename,'gif','DelayTime',0.1,'Loopcount',inf);
    else
        imwrite(imind,cm,filename,'gif','WriteMode','append','DelayTime',0.1);
    end
    writeVideo(v,im);
    pause(0.01);
end
close(v);
end

