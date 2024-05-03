clear;
close all;
clc;
x = linspace(-2e-3, +2e-3, 50); % Define simulation domain boundary
y = linspace(-2e-3, +2e-3, 50);
Q = 1e-6; % Q = 1 uC
C = 9e+9; % Coulomb force constant in free space
Q1 = Q; % Charge and position of Q1
Q2 = -Q; % Charge and position of Q2
x_1 = -0.5e-3; % x-coordinate of Q1
x_2 = 0.5e-3; % x-coordinate of Q2
y_0 = 0; % y-coordinate of Q1
y_1 = 0; % y-coordinate of Q2
for i = 1:length(y) % Electric potential for individual Q1 at individual point
    for j = 1:length(x)
        r1 = sqrt((x(j) - x_1)^2 + (y(i) - y_0)^2);
        r2 = sqrt((x(j) - x_2)^2 + (y(i) - y_0)^2);
        V1(i, j) = (C * Q1 / r1) + (C * Q2 / r2);
    end
end
[Ex1, Ey1] = gradient(-V1); % Electric field = negative gradient of potential
E1 = sqrt(Ex1.^2 + Ey1.^2); % Scaling the arrow lengths for better visualization of field lines
max_E1 = max(max(E1));
min_E1 = min(min(E1));
E_scale1=min_E1+(max_E1-min_E1)/100;

E_x1 = Ex1;
E_y1 = Ey1;
size(E1) % why tf is it not the same size
size(E_scale1)
size(E_x1)

E_x1(E1>E_scale1) = E_x1(E1>E_scale1)./E1(E1>E_scale1)*E_scale1;
E_y1(E1>E_scale1) = E_y1(E1>E_scale1)./E1(E1>E_scale1)*E_scale1;
E_norm1 = sqrt(E_x1.^2 + E_y1.^2);

[X1, Y1] = meshgrid(x, y);
[X2, Y2] = meshgrid(x, y);

figure(1)
quiver(X1,Y1,Ex1,Ey1);

hold on;
contour(X1,Y1,V1,64);
hold on;
scatter([x_1,x_2], [y_0,y_1], 100, 'filled', 'red', 'blue');
xlabel('x[m]');
ylabel('y[m]');
title('Equipotential Surfaces');
grid on;

figure(2)
quiver(X1,Y1,E_x1,E_y1);

hold on;
contour(X1,Y1,E_norm1,64);

hold on;
scatter([x_1, x_2], [y_0, y_1], 50, 'filled', 'red', 'blue');
xlabel('x[m]');
ylabel('y[m]');
title('Electric Field Lines');
grid on;
