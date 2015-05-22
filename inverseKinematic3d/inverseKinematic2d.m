clc, close all, clear all

g=10;                       %steps between min/max angle
t1sa=0;                     %bar 1 start angle
t1ea=pi;                    %bar 1 end angle 
step1 = abs(t1sa-t1ea)/g;   %steps between the angles
theta1 = t1sa:step1:t1ea;

t3sa=0;                     %bar 3 start angle
t3ea=3*pi/2;                %bar 3 end angle 
step3 = abs(t3sa-t3ea)/g;   %steps between the angles
theta3 = t3sa:step3:t3ea;

rx1=0;                      %X,Y position of joint O (base)
ry1=0;                      %
rx3=8;                      %X,Y position of joint C (the desired end point)
ry3=4;                      %
r1=3;                       %length of bar 1
r2=4;                       %length of bar 2
r3=3;                       %length of bar 3

x1=r1.*cos(theta1)+rx1;     %calculating the coordinates of the end point of bar 1
y1=r1.*sin(theta1)+ry1;     %

x3=r3.*cos(theta3)+rx3;     %calculating the coordinates of the end point of bar 1
y3=r3.*sin(theta3)+ry3;     %

z=0;                        %counter variable for the coords matrix (to keep track of the current row)
coords=[];                  %matrix where all viable coordinates will be stored
error=0.1;                  %allowed +- error of the position

plot(x1,y1,x3,y3, 'LineWidth', 1) %plot the trajectories of the end point of bar 1 (point A) and bar 2 (point B)
hold on
grid on                                       %additional cosmetics  
axis([-5 15 -5 15])                           %  
plot([0 0], [-5 15], 'black' ,'LineWidth', 2) %
plot([-5 15], [0 0], 'black' ,'LineWidth', 2) %


for n=1:(size(x1, 2))
    for i=1:(size(x1,2))
        dist = sqrt(((x3(i)-x1(n))^2)+((y3(i)-y1(n))^2));       %take current start/end positions of bar 2 and calculate the length between them 
        if (dist > r2 && dist < r2 + error) || (dist < r2 && dist > r2 - error)    %check if the length is equal to the length of bar 2 within the allowed error
            plot([x1(n) x3(i)], [y1(n) y3(i)],'red', 'LineWidth', 2) %plot the position of bar 2
            plot([x1(n) rx1], [y1(n) ry1], 'blue', 'LineWidth', 2)                  %plot the position of bar 1
            plot([x3(i) rx3], [y3(i) ry3], 'blue', 'LineWidth', 2)                  %plot the position of bar 3
            z = z+1;                                           %row counting for coords matrix
            coords(z , 1) = x1(n);                             %save the X,Y coordinates of point A
            coords(z , 2) = y1(n);                             %
            coords(z , 3) = x3(i);                             %save the X,Y coordinates of point B
            coords(z , 4) = y3(i);                             %
        end
        pause(0.001)
    end
end

