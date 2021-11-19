%%CREATES PLOTS WITH THE OPTIMISED VALUES WITH LEGENDS

clear all
clc 
close all



optimised_values = [54.0000   11.0000   13.5000   39.0000]

an = 4;
ce = 80;
z0 = optimised_values(1);
z9 = optimised_values(2);
ab = optimised_values(3);
bc = optimised_values(4);

beta_1 = linspace(-pi()/3, pi()/3, 50);
alpha_1 = linspace(pi() - ((z0/z9)*pi()/3), pi() + ((z0/z9)*pi()/3), 50);

xn = 0;
yn = 0;

a_centre_x = xn - an*sin(beta_1);
a_centre_y = yn - an*cos(beta_1);

xa = xn - an*sin(beta_1) + 1.9*sin(alpha_1);
ya = yn - an*cos(beta_1) + 1.9*cos(alpha_1);

xb = a_centre_x + ab*cos((- beta_1 + alpha_1));
yb = a_centre_y + ab*sin((- beta_1 + alpha_1));

%USE SIN RULE TO CALCULATE SIGMA

sigma = asin((sin(alpha_1)*ab)/bc);

xc = a_centre_x + ab*sin(alpha_1 - beta_1) - bc*sin(sigma + beta_1);
yc = a_centre_y + ab*cos(alpha_1 - beta_1) + bc*cos(sigma + beta_1);

%beta_range = -pi()/3:0.1:pi()/3;

ex = xc + ce*sin(-beta_1);

ey = yc + ce*cos(-beta_1);

figure(2);
hold on;
grid on;
axis([-120 120 -20 120]);
pbaspect([1 1 1]);

bounds_of_screen = [-100 -100 100 100; 0 110 110 0];
plot(bounds_of_screen(1,:), bounds_of_screen(2,:),'color',	'#4DBEEE');

plot(xn ,yn, 'o');
plot(a_centre_x, a_centre_y);
% plot(xa,ya);        %arc
% plot(xb(1), yb(1) , 'o');    %circle (oval)
plot(xb,yb, 'color', 	'#EDB120');  
plot(xc, yc, 'color', '#7E2F8E');      %line atm
plot(ex,ey,'color', '#77AC30')  %arc
legend("Boundary of windscreen","Points N, fixed centre","Path of Point A","Path of Point B","Path of Point C","Path of Point E")

figure(3)
hold on;
grid on;

pbaspect([1 1 1]);

axis([-120 120 -20 120]);
plot(ex,ey)  %arc,

bounds_of_screen = [-100 -100 100 100; 0 110 110 0];
plot(bounds_of_screen(1,:), bounds_of_screen(2,:));
legend("Path of Point E","Boundary of windscreen")
