close all;
clear;

% Location of train
x = 0;

L = 1200;  % Length of bridge
n = 1200;  % Discretize into 1 mm seg.
P = 400;  % Total weight of train [N]
x_increments = linspace(0, L, n+1);
x_shear_start = (720-x)/3;  % Starting shear at the pin/roller

% One offset because MATLAB indexes with 1
% Another offset to shift cumsum left 1
x_shear_locations = [x+52, x+228, x+392, x+568, x+732, x+908];
x_train_loads = [-P/6, -P/6, -P/6, -P/6, -P/6, -P/6];

x_shear = zeros(1, L+1);
%x_shear(1) = x_shear_start;  % Starting shear at the pin/roller
x_shear(x_shear_locations+1) = x_train_loads;
x_shear = cumsum([x_shear, 0]);  % Final shear force diagram

x_moment = cumsum(x_shear) - x_shear_start;


plot(x_shear)
figure
plot(x_moment)

x_moment(52)


