function DrawPlat(theta,x,z,colorSel)
%DrawPlat this function will draw the platform.
%angle is the incline angle of the platform
%colorSel is the platform color
quadLine=[0:0.05:.5;...
          zeros(1,11)];
quadnew=[cos(theta) sin(theta);...
    -sin(theta) cos(theta)]*quadLine+[x;z]*ones(1,11);

plot(quadnew(1,:),quadnew(2,:),colorSel,'LineWidth',1.5);
end