clc, clear all, close all

g=150;                  %step between the angles (iterations for each loop)
%bar 1
tsa=0;                  %bar 1 start angle
tea=2*pi;               %bar 1 end angle 
step = abs(tsa-tea)/g;  %steps between the angles
theta = tsa:step:tea;   %angle positions

%bar 2
psa = 0;                %bar 2 start angle
pea = pi*2;             %bar 2 end angle
step1 = abs(psa-pea)/g; %steps between the angles
phi = psa:step1:pea;    %angle positions

%bar 3
zsa = 0;                %bar 3 start angle
zea = 2*pi;             %bar 3 end angle
step2 = abs(zsa-zea)/g; %steps between the angles
zeta = zsa:step2:zea;   %angle positions

rhomin = 3;
rhomax = 5;
rhostep = abs(rhomin-rhomax)/g;

rho = 5;      %length of bar 1
rho1 = 1.5;   %length of bar 2
rho2 = 0.5;   %length of bar 3

sz = (rho+rho1+rho2)*200 +(rho+rho1+rho2)*200*0.05; %size of the matrix
positions = ones(sz)*255; %plot matrix

x1 = rho*cos(theta); %x positions of bar 1
x2 = rho1*cos(phi);  %x positions of bar 2
x3 = rho2*cos(zeta); %x positions of bar 3

y1 = rho*sin(theta); %y positions of bar 1
y2 = rho1*sin(phi);  %y positions of bar 2
y3 = rho2*sin(zeta); %y positions of bar 3


    for i = 1:size(theta, 2)               % plot the possible 
       for n = 1:size(phi, 2)              % positions of the
           for m = 1:size(zeta, 2)         % end point of bar 3
               x = x1(i) + x2(n) + x3(m);
               y = y1(i) + y2(n) + y3(m);
               positions(floor(size(positions, 1)/2+x*100), floor(size(positions, 2)/2+y*100)) = 0;
           end
       end
    end
imshow(uint8(rot90(positions)))