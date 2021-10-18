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

beta_1 = linspace(-pi()/3, pi()/3, 50);
alpha_1 = linspace(0, 4*pi(), 50);

xn = 0;
yn = 0;


xa = an*sin(beta_1) + 1.9*sin
ya = an*cos(beta_1);

xb = ab*cos((beta_1 + alpha_1));
yb = ab*sin((beta_1 + alpha_1));

%USE SIN RULE TO CALCULATE SIGMA

sigma = asin((sin(alpha_1)*ab)/bc);

xc = ab*cos(alpha_1) + bc*cos(sigma);
yc = ab*sin(alpha_1) - bc*sin(sigma);

%beta_range = -pi()/3:0.1:pi()/3;

ex = ce*sin(beta_1);

ey = ce*cos(beta_1);

hold on;
plot(ex,ey)  %arc
plot(xa,ya);        %arc
plot(xb, yb);    %circle (oval)
plot(xc, yc);      %line atm



pbaspect([1 1 1])

axis([-80 80 -20 100]);




