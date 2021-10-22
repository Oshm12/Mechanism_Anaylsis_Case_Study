close all;
clear

omega_9 = 0.5;
omega_5 = 1;
ab = 2.1
bc = 15.5
an = 4
ce = 80
z9 = 20     %pinion
z0 = 90     %housing




%%Important angles
beta_1 = pi()/3;
alpha_1 = pi()/3;

%rate of change angle (speeds) 
alpha_1_omega = 0.1;
beta_1_omgea = alpha_1_omega * (z9/z0);
close all;
clear

omega_9 = 0.5;
omega_5 = 1;
ab = 2.1
bc = 15.5
an = 4
ce = 80
z9 = 20     %pinion
z0 = 90     %housing


%optimistaion fmincom
%fminbud
[z0,z9,ab,bc];

%%Important angles
beta_1 = pi()/3;
alpha_1 = pi()/3;

%rate of change angle (speeds) 
alpha_1_omega = 0.1;
beta_1_omgea = alpha_1_omega * (z9/z0);

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

ex = xc + ce*sin(beta_1);

ey = yc + ce*cos(beta_1);

figure(1);
hold on;
grid on;

pbaspect([1 1 1]);

plot(xn ,yn, 'o');
plot(a_centre_x, a_centre_y);
plot(xa,ya);        %arc
plot(xb(1), yb(1) , 'o');    %circle (oval)
plot(xb,yb);  
plot(xc, yc);      %line atm
plot(ex,ey)  %arc




axis([-80 80 -20 100]);



%% OPTIMISATION 

[z0,z9,ab,bc];

polypoints_x = [ex xc];
polypoints_y = [ey yc];
    
a = polyarea(polypoints_x, polypoints_y)

