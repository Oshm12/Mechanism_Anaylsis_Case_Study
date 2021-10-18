%%Matlab script to animate the Mercedes wiper blade for CS1

omega_1 = 0.4;
alpha_1 = pi()/6;
alpha_1 = pi()/6;
l1 = 1,2;
l2 = 3;

 test = true;

x0 = 0;
y0 = 0;

for i = 1:50

    pause(0.01);

    alpha_2 = asin(y1/l2);


x1 = l1*cos(alpha_1)
y1 = l1*sin(alpha_1)

alpha_2 = sin(y1/x1);

x2 = l1*cos(alpha_1) + l2*cos(alpha_2);
y2 = 0 %l1*sin(alpha_1) - l2*sin(alpha_2);

%

figure(1);
hold off;
plot([ x0 x1], [y0 y1]);
hold on;
axis([-3 5 -2 2]);
plot([x1,x2], [y1, y2]);



alpha_1 = alpha_1 + omega_1;



end