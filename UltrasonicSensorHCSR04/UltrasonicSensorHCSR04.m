%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%         TODOR VACHEV         %%%%%%
%%%%%%% TECHNICAL UNIVERSITY - VARNA %%%%%%
%%%%%%%        DECEMBER, 2014        %%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
close all;             %close all opened figures
clear all;             %clear all stored variables
clc;                   %clear the command window
delete(instrfindall);  %close all opened serial …
                       %… ports that are not in use

%initialize serial communication
s1 = serial('COM3');         %define serial port
set(s1, 'DataBits', 8);      %define received data length in bits
set(s1, 'StopBits', 1);      %define number of bits used to … 
                             %… indicate the end of a byte
set(s1, 'BaudRate', 9600);   %define the baud rate (bits/sec)
fopen(s1);                   %open serial port
flushinput(s1);              %clear any stored data on …
                             %… the serial port

%initialize the plot
plot(0,0);                         %empty plot
hold on                            %hold the plot
grid on                            %turn the grid on
xlabel('Time, [s]', 'FontName', 'Times New Roman', 'FontSize', 14);           %label for the x axis
ylabel('Distance, [cm]','FontName', 'Times New Roman', 'FontSize', 14);       %label for the y axis
title('Ultrasonic Ranging Module HC-SR04', 'FontName',...
'Times New Roman', 'FontSize', 14) %set the plot title
axis([-10 10 0 400])                 %set x and y axis limits

%initialize variables
n = 3600;                          %runtime in milliseconds
data = 0;                          %initialize acquired data variable
distance = 0;                      %initialize distance variable
xpos = 0;                          %initialize x-axis position variable

%initialize data acquiring and plotting
for i = 1:n
 data = str2double(fscanf(s1));        %write received data
 plot(xpos, data, '.r', 'LineWidth', 1.5) %label for the x axis
 drawnow                               %plot the data with each iteration         
 distance = num2str(data);             %convert data to string
 title(strcat('Distance: ', distance, ' cm')); %print the data in the title
 kkey = get(gcf, 'CurrentCharacter');  %get current pressed character
 if strcmp(kkey, 's')                  %compare if the character is 's'
     fwrite(s1, 10)                    %send the int 10 to Arduino
     keyboard                          %initialize keyboard input from user
     set(gcf, 'CurrentCharacter', char(1)) %clear current pressed character
     fwrite(s1, 1)                     %send the int 1 to Arduino
 end
end

%end of communication
fclose(s1);                            %stop data reading
delete(instrfindall);                  %close the serial port

%fscanf reads the data from the serial port and converts it to text
%str2double converts string into double, since Arduino prints
%ASCII characters to the serial port we need to convert them 
%into double so that we can plot and manipulate the data