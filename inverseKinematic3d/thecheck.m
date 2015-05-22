function [result, anglexOy, angleyOz] = thecheck(v1, v2, xOylim1, xOylim2, yOzlim1, yOzlim2)

vector1xOy = [v1(1) v1(2)]; %get current vector projection on the xOy plane of bar 1/bar 2
vector2xOy = [v2(1) v2(2)]; %get current vector projection on the xOy plane of bar 2/bar 3
vector1yOz = [v1(2) v1(3)]; %get current vector projection on the yOz plane of bar 1/bar 2
vector2yOz = [v2(2) v2(3)]; %get current vector projection on the yOz plane of bar 2/bar 3

%calculate the angle between the vectors in the xOy plane in degrees
anglexOy = rad2deg(acos((dot(vector1xOy,vector2xOy)/(norm(vector1xOy)*norm(vector2xOy))))); 
%calculate the angle between the vectors in the yOz plane in degrees
angleyOz = rad2deg(acos((dot(vector1yOz,vector2yOz)/(norm(vector1yOz)*norm(vector2yOz))))); 

k1=vector1xOy(2)/vector1xOy(1); %calculate the k1 and k2 coefficients
k2=vector1yOz(2)/vector2yOz(1); %

if vector2xOy(2)>k1*vector2xOy(1) %check the orientation of the angle, is it positive?
    %disp(sprintf('xOy angle is %g degrees', anglexOy))
else
    anglexOy = (-1)*anglexOy;     %well then I guess if you are here it is negative.
    %disp(sprintf('xOy angle is %g degrees', anglexOy))
end

if vector2yOz(2)>k2*vector2yOz(1) %check the orientation of the angle, is it positive?
    %disp(sprintf('yOz angle is %g degrees', angleyOz))
else
    angleyOz = (-1)*angleyOz;     %well then I guess if you are here it is negative.
    %disp(sprintf('yOz angle is %g degrees', angleyOz))
end

anglexOy = deg2rad(anglexOy); %convert the angles back to radians
angleyOz = deg2rad(angleyOz); %

%check if the angles are within the specified limitations
if (anglexOy > xOylim1 && anglexOy < xOylim2) && (angleyOz > yOzlim1 && angleyOz < yOzlim2)
    result = 1;          %return 1 if the angles are within the limits
else
    result = 0;          %return 0 if the angles are not within the limits
end

end