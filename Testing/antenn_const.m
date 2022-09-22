clear all;
close all;
clc;
%% Plot antenna constellation points

% Define coordinates of each node
TH = [-7.1 -41.1 -37.1 -58.3 -58.3 -37.4 -40.7 -7.1 16.3 47.2 56.6 43.4 56.7 47.2 16.3 6.4 -16.5 -16.5 6.4 20.1];
PH = [148.4 136.9 113.7 101.6 78.4 66.2 43.3 31.6 49.2 49.2 71.0 90.0 108.9 130.8 130.8 109.1 101.6 78.4 70.9 90.0];

%tilt coordinates from x-axis to z-axis (original data was pointing to side)
[X,Y,Z] = angle2cart(PH*pi/180,TH*pi/180,1);

%Rotation Around X-axis:
theta=60; %theta 0 results in an offset from the bucky
X1 = X;
Y1 = Y*cos(theta) - Z*sin(theta);
Z1 = Y*sin(theta) + Z*cos(theta);


%% Generate geodesic ADome structure
[A, xy] = bucky;         % Generate bucky matrix 
[i, j] = find(triu(A));  
B = permute(cat(3, xy(i, :),xy(j, :)), [3 1 2]);

% Plot upper-part bucky 
length = 1:40;
plot3(B(:, length, 1), B(:, length, 2),B(:, length, 3));
hold on

% Plot constellation points
plot3(-Z1,Y1,X1,'.','markersize',30);
axis equal 
grid on

%Defining plot properties
%lightGrey = 0.8*[1 1 1]; % It looks better if the lines are lighter
xlim([-1 1]);
ylim([-1 1]);
zlim([-1 1]);

function [x,y,z] = angle2cart(th, ph, r, degRad)
if nargin > 3 
    if strcmp(degRad,'deg')
        ph = ph .* pi ./ 180;
        th = th .* pi ./ 180;
    end
end
x = r .* sin(th).* cos(ph);
y = r .* sin(th).* sin(ph);
z = r .* cos(th);
end
