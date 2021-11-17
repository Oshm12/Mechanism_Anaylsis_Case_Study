close all;
clear
% 
%   158.0000   25.0000    4.2000    7.5000
%   78.0000   17.0000    4.2000   25.5000



omega_9 = 0.5;
omega_5 = 1;
ab = 2.1
bc = 15.5
an = 4
ce = 80
z0 = 90      %housing
z9 = 20     %pinion
    


%optimistaion fmincom
%fminbud
optimised_values = [z0,z9,ab,bc];

%%Important angles
beta_1 = pi()/3;
alpha_1 = pi()/3;

%optimisation bounds
z0 = 40:2:140;
z9 = 5:2:50;


ab = 0.5:1:25;
bc = 2:1:60;

%comparison values
percentage_unused_max = 1;
index = 0;

for i = 1:length(z0)

    for j = 1:length(z9)

        for k = 1:length(ab)

            for l = 1:length(bc)
                
                beta_1 = linspace(-pi()/3, pi()/3, 50);
                alpha_1 = linspace(pi() - ((z0(i)/z9(j))*pi()/3), pi() + ((z0(i)/z9(j))*pi()/3), 50);
                
                xn = 0;
                yn = 0;
                
                a_centre_x = xn - an*sin(beta_1);
                a_centre_y = yn - an*cos(beta_1);
                
                xa = xn - an*sin(beta_1) + 1.9*sin(alpha_1);
                ya = yn - an*cos(beta_1) + 1.9*cos(alpha_1);
                
                xb = a_centre_x + ab(k)*cos((- beta_1 + alpha_1));
                yb = a_centre_y + ab(k)*sin((- beta_1 + alpha_1));
                
                %USE SIN RULE TO CALCULATE SIGMA
               
                sigma = asin((sin(alpha_1)*ab(k))/bc(l));
                
                xc = a_centre_x + ab(k)*sin(alpha_1 - beta_1) - bc(l)*sin(sigma + beta_1);
                yc = a_centre_y + ab(k)*cos(alpha_1 - beta_1) + bc(l)*cos(sigma + beta_1);
                
                %beta_range = -pi()/3:0.1:pi()/3;
                
                ex = xc + ce*sin(-beta_1);
                
                ey = yc + ce*cos(-beta_1);
                
                %Evaluated the variables 

                
%                 polypoints_x = [ex xc];
%                 polypoints_y = [ey yc];
%                     
%                 wiper_area = polyarea(polypoints_x, polypoints_y);

                
                wiper_area = trapz( ey);
                 
                
                screen_area = 200*110;
                
                unused_area = screen_area - wiper_area;
                
                percentage_unused = unused_area/screen_area;

                

                if ~any(ey > 110)
                   
                    
                    if ~any(ex < -100)
                        
                        if ~any(ex > 100)

                            if percentage_unused < percentage_unused_max
                                
                                optimised_values = [z0(i), z9(j), ab(k), bc(l)];
                                percentage_unused_max = percentage_unused;
                                disp("NEW BEST VALUE");
                                disp(~any(ex < -100))
                                disp(~any(ex > 100))
                                disp(optimised_values);
                            end

                        end

                    end
                
                end
                    
                

                index = index + 1;

            end
        end
    end
end

disp("Done");

disp(percentage_unused_max);
disp(optimised_values);


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

figure(1);
hold on;
grid on;

pbaspect([1 1 1]);

bounds_of_screen = [-100 -100 100 100; 0 110 110 0];
plot(bounds_of_screen(1,:), bounds_of_screen(2,:));

plot(xn ,yn, 'o');
plot(a_centre_x, a_centre_y);
plot(xa,ya);        %arc
plot(xb(1), yb(1) , 'o');    %circle (oval)
plot(xb,yb);  
plot(xc, yc);      %line atm
plot(ex,ey)  %arc



