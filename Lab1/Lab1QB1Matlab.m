clear;
close all;
clc;
x = linspace(-2e-3,+2e-3,50); %Define simulation domain boundary
y = linspace(-2e-3,+2e-3,50);
Q = 1e-6; %Q = 1 uC
C = 9e+9; %Coulomb force constanct in free space
Q1 = -Q; %charge and position of Q1
x_0 = 0;
y_0 = 0;
for i=1:length(y) %Electric potential for individual Q1 at individual point
    for j=1:length(x)
        r(i,j)=sqrt((x(j)-x_0)^2 + (y(i)-y_0)^2);
        V(i,j)=C*Q1/r(i,j);
    end
end
[Ex, Ey] = gradient(-V); %Electric field = negative gradient of potential
E= sqrt(Ex.^2+Ey.^2); %Scaling the arrowlenghts for better visualization of field lines
max_E = max(max(E));
min_E = min(min(E));
E_scale=min_E+(max_E-min_E)/100;
E_x = Ex;
E_y = Ey;
E_x(E>E_scale) = E_x(E>E_scale)./E(E>E_scale)*E_scale;
E_y(E>E_scale) = E_y(E>E_scale)./E(E>E_scale)*E_scale;
E_norm = sqrt(E_x.^2 + E_y.^2);
[X, Y] = meshgrid(x,y);
figure(1)
quiver(X,Y,Ex,Ey);
hold on;
contour(X,Y,V,64);
hold on;
title('Equipotential Surfaces');
xlabel('x[m]');
ylabel('y[m]');
scatter(x_0, y_0, 100, 'filled','red');
figure(2)
quiver(X,Y,E_x,E_y);
title('Electric Field Lines');
xlabel('x[m]');
ylabel('y[m]');
hold on;
contour(X,Y,E_norm,64);
hold on;
scatter(x_0, y_0, 50, 'filled','red');
