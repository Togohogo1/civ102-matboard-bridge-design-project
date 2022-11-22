close all;
clear;

% Location of train
x = 0;

L = 1200;  % Length of bridge
n = 1200;  % Discretize into 1 mm seg.
P = 400;  % Total weight of train [N]
lhs_dist = linspace(0, L, n+1);
x_shear_start = (720-x)/3;  % Starting shear at the pin/roller

% One offset because MATLAB indexes with 1
% Another offset to shift cumsum left 1
x_shear_locations = [x+52, x+228, x+392, x+568, x+732, x+908] + 2;
x_train_loads = [-P/6, -P/6, -P/6, -P/6, -P/6, -P/6];

x_shear = zeros(1, L+1);
x_shear(1) = x_shear_start;  % Starting shear at the pin/roller
x_shear(x_shear_locations) = x_train_loads;
x_shear = cumsum(x_shear);  % Final shear force diagram

x_moment = cumsum(x_shear) - x_shear_start;

% Getting x_moment at 0mm -> query x_moment(1+1)
% Getting x_moment at 1mm -> query x_moment(1+1)



plot(lhs_dist, x_shear)
figure
plot(lhs_dist, x_moment)