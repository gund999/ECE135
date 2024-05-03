clear;
close all;
clc;
x = linspace(-2e-3,+2e-3,500); %Define simulation domain boundary
Q = 1e-6; %Q = 1 uC
K = 9e+9; %Coulomb force constanct in free space
Q1 = 2*Q; %charge and position of Q1
V = K*Q1./abs(x); % Electric Field Intensity
E = gradient(-V); % Electric Potential

figure(1),
plot(x*1e+3,V);
xlabel('x[mm]');
ylabel('V[V]');
figure(2),
plot(x*1e+3,E);
xlabel('x[mm]');
ylabel('E[V/m]');
