clc, clear all, close all
g=30;                   %steps between min/max angle
%bar 1
tsa=0;                  %bar 1 start angle
tea=pi/2;               %bar 1 end angle 
step = abs(tsa-tea)/g;  %steps between the angles
theta = tsa:step:tea;   %angle positions

%bar 2
psa = 0;                %bar 2 start angle
pea = pi;               %bar 2 end angle
step1 = abs(psa-pea)/g; %steps between the angles
phi = psa:step1:pea;    %angle positions

%bar 3
zsa = 0;                %bar 3 start angle
zea = pi/10;            %bar 3 end angle
step2 = abs(zsa-zea)/g; %steps between the angles
zeta = zsa:step2:zea;   %angle positions


rho = 3;      %length of bar 1
rho1 = 1.5;   %length of bar 2
rho2 = 0.5;   %length of bar 3

x1 = rho*cos(theta); %x positions of bar 1
x2 = rho1*cos(phi);  %x positions of bar 2
x3 = rho2*cos(zeta); %x positions of bar 3

y1 = rho*sin(theta); %y positions of bar 1
y2 = rho1*sin(phi);  %y positions of bar 2
y3 = rho2*sin(zeta); %y positions of bar 3
plot(0,0)            %empty plot
hold on
grid on

for i = 1:size(theta, 2)               %  
   for n = 1:size(phi, 2)              % 
       for m = 1:size(zeta, 2)         % plot the possible
           x = x1(i) + x2(n) + x3(m);  %
           y = y1(i) + y2(n) + y3(m); 
           plot(x, y, '.r', 'LineWidth', 1)
           %pause(0.01)
       end                             % end point of bar 3
   end                                 %
end                                    %