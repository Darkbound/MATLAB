function imflip(x)
IMAGE=imread(x); %loading the image

A=IMAGE(:,:,1);   % breaking the 3d matrix into 3x2d matrices
B=IMAGE(:,:,2);   %
C=IMAGE(:,:,3);   %

%initializing variables
[r1, r2]=deal(size(A,1));
[c1, c2]=deal(size(A,2));
[Aremain, Bremain, Cremain]=deal(zeros(size(A)));

%if the rows or columns number of the image divided by 100 has a remainder
if rem(size(A,1), 100)~=0 || rem(size(A,2), 100)~=0
    
    %initializating variables
    [A1remain, A2remain, B1remain, B2remain, C1remain, C2remain]=deal(zeros(size(A)));
    r=floor(r2/100-1); %rows
    c=floor(c2/100-1); %columns
    %recalculating rows and columns number without the leftovers
    r2=size(A,1)-rem(size(A,1), 100);
    c2=size(A,2)-rem(size(A,2), 100);
    
    %leftovers from A
    for n=0:r %flipping rows
        A1remain(1+100*n:50+100*n,c1-rem(c1, 100):c1)=A(51+100*n:100+100*n,c1-rem(c1,100):c1);
        A1remain(51+100*n:100+100*n,c1-rem(c1, 100):c1)=A(1+100*n:50+100*n,c1-rem(c1,100):c1);
    end 
    for n=0:c %flipping columns
        A2remain(r1-rem(r1,100):r1, 1+100*n:50+100*n)=A(r1-rem(r1,100):r1, 51+100*n:100+100*n);
        A2remain(r1-rem(r1,100):r1, 51+100*n:100+100*n)=A(r1-rem(r1,100):r1, 1+100*n:50+100*n);
    end 
    Aremain=A1remain+A2remain;
    Aremain(r1-rem(r1,100):r1, c1-rem(c1,100):c1)=A(r1-rem(r1,100):r1, c1-rem(c1,100):c1);
    
    %leftovers from B
    for n=0:r %flipping rows
        B1remain(1+100*n:50+100*n,c1-rem(c1, 100):c1)=B(51+100*n:100+100*n,c1-rem(c1,100):c1);
        B1remain(51+100*n:100+100*n,c1-rem(c1, 100):c1)=B(1+100*n:50+100*n,c1-rem(c1,100):c1);
    end 
    for n=0:c %flipping columns
        B2remain(r1-rem(r1,100):r1, 1+100*n:50+100*n)=B(r1-rem(r1,100):r1, 51+100*n:100+100*n);
        B2remain(r1-rem(r1,100):r1, 51+100*n:100+100*n)=B(r1-rem(r1,100):r1, 1+100*n:50+100*n);
    end 
    Bremain=B1remain+B2remain;
    Bremain(r1-rem(r1,100):r1, c1-rem(c1,100):c1)=B(r1-rem(r1,100):r1, c1-rem(c1,100):c1);
    
    %leftovers from C
    for n=0:r %flipping rows
        C1remain(1+100*n:50+100*n,c1-rem(c1, 100):c1)=C(51+100*n:100+100*n,c1-rem(c1,100):c1);
        C1remain(51+100*n:100+100*n,c1-rem(c1, 100):c1)=C(1+100*n:50+100*n,c1-rem(c1,100):c1);
    end
    for n=0:c %flipping columns 
        C2remain(r1-rem(r1,100):r1, 1+100*n:50+100*n)=C(r1-rem(r1,100):r1, 51+100*n:100+100*n);
        C2remain(r1-rem(r1,100):r1, 51+100*n:100+100*n)=C(r1-rem(r1,100):r1, 1+100*n:50+100*n);
    end
    Cremain=C1remain+C2remain;
    Cremain(r1-rem(r1,100):r1, c1-rem(c1,100):c1)=C(r1-rem(r1,100):r1, c1-rem(c1,100):c1);
    
end

r=floor(r2/100-1); %rows
c=floor(c2/100-1); %columns

%flipping columns for matrix A
[ReshapedA1, ReshapedA2]=deal(zeros(size(A)));
for n=0:c
    ReshapedA1(:, 1+100*n:50+100*n)=A(:, 51+100*n:100+100*n);
    ReshapedA2(:, 51+100*n:100+100*n)=A(:, 1+100*n:50+100*n);
end
ReshapedA3=ReshapedA1+ReshapedA2;
    
%flipping rows for matrix A
[ReshapedA1, ReshapedA2]=deal(zeros(size(ReshapedA3)));
for n=0:r
    ReshapedA1(1+100*n:50+100*n, :)=ReshapedA3(51+100*n:100+100*n, :);
    ReshapedA2(51+100*n:100+100*n, :)=ReshapedA3(1+100*n:50+100*n, :);
end
ReshapedA=ReshapedA1+ReshapedA2+Aremain; %Reshaped A matrix

%flipping columns for matrix B
[ReshapedB1, ReshapedB2]=deal(zeros(size(B)));
for n=0:c
    ReshapedB1(:, 1+100*n:50+100*n)=B(:, 51+100*n:100+100*n);  
    ReshapedB2(:, 51+100*n:100+100*n)=B(:, 1+100*n:50+100*n);
end
ReshapedB3=ReshapedB1+ReshapedB2;

%flipping rows for matrix B
[ReshapedB1, ReshapedB2]=deal(zeros(size(ReshapedB3)));
for n=0:r
    ReshapedB1(1+100*n:50+100*n, :)=ReshapedB3(51+100*n:100+100*n, :);
    ReshapedB2(51+100*n:100+100*n, :)=ReshapedB3(1+100*n:50+100*n, :);
end
ReshapedB=ReshapedB1+ReshapedB2+Bremain; %Reshaped B matrix

%flipping columns for matrix C
[ReshapedC1, ReshapedC2]=deal(zeros(size(C)));
for n=0:c
    ReshapedC1(:, 1+100*n:50+100*n)=C(:, 51+100*n:100+100*n);
    ReshapedC2(:, 51+100*n:100+100*n)=C(:, 1+100*n:50+100*n);
end
ReshapedC3=ReshapedC1+ReshapedC2;

%flipping rows for matrix C
[ReshapedC1, ReshapedC2]=deal(zeros(size(ReshapedC3)));
for n=0:r
    ReshapedC1(1+100*n:50+100*n, :)=ReshapedC3(51+100*n:100+100*n, :);
    ReshapedC2(51+100*n:100+100*n, :)=ReshapedC3(1+100*n:50+100*n, :);
end
ReshapedC=ReshapedC1+ReshapedC2+Cremain; %Reshaped C matrix

%Reassembling the 3d matrix
ReshapedIMAGE(:,:,1)=ReshapedA;
ReshapedIMAGE(:,:,2)=ReshapedB;
ReshapedIMAGE(:,:,3)=ReshapedC;

imshow(uint8(ReshapedIMAGE))
end