%% Program to fit a linear, quadratic, cubic, and fourth order polynomial to the given data

%data points
data =  [0,0;
        0.2,1.05;
        0.4,0.85;
        0.6,0.35;
        0.8,0.10;
        1.0,1.00];
    
[m,n]=size(data); %defines m and n using the size of data

% f(x) = c1 + c2*x^2 + c3*x^3 + c4*x^4 + . . . . + cn*x^n
%% 1st order
A1 = zeros(m,2); %creates a zero matrix of dimension m by 2
b1 = zeros(m,1); %creates a zero matrix of dimension m by 2

% Loop populates the required matrix
for i = 1:m
    A1(i,1)=1; %1st column
    A1(i,2)=data(i,1); % 2nd column
    b1(i,1)=data(i,2); % y column
end
x1=inv(A1'*A1)*(A1'*b1)  
    
%% 2nd Order    
A2 = zeros(m,3);
b2 = zeros(m,1);

for i = 1:m
    A2(i,1)=1;
    A2(i,2)=data(i,1);
    A2(i,3)=data(i,1)^2;
    b2(i,1)=data(i,2);
end
x2=inv(A2'*A2)*(A2'*b2)

%% 3rd order
A3 = zeros(m,4);
b3 = zeros(m,1);

for i = 1:m
    A3(i,1)=1;
    A3(i,2)=data(i,1);
    A3(i,3)=data(i,1)^2;
    A3(i,4)=data(i,1)^3;
    b3(i,1)=data(i,2);
end
x3=inv(A3'*A3)*(A3'*b3)

%% 4th order
A4 = zeros(m,5);
b4 = zeros(m,1);

for i = 1:m
    A4(i,1)=1;
    A4(i,2)=data(i,1);
    A4(i,3)=data(i,1)^2;
    A4(i,4)=data(i,1)^3;
    A4(i,5)=data(i,1)^4;
    b4(i,1)=data(i,2);
end
x4=inv(A4'*A4)*(A4'*b4)

%% Graphics
x=0:0.01:1;
linear=x1(1)+x1(2).*x;
quadratic=x2(1)+x2(2).*x+x2(3).*x.^2;
cubic=x3(1)+x3(2).*x+x3(3).*x.^2+x3(4).*x.^3;
order4=x4(1)+x4(2).*x+x4(3).*x.^2+x4(4).*x.^3+x4(5).*x.^4;
plot(x,linear,x,quadratic,x,cubic,x,order4)
hold on
plot(data(:,1),data(:,2), 'o')
xlabel('x')
ylabel('f')
title('Interpolating curves')
legend('linear','quadratic','cubic','order4')



