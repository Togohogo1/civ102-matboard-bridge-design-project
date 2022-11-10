%% Title

%% Double Percent for Section Break
%{
multiline
comments
when
necessary

to open as live script, right click tab and select open as live script
- i plan to use comments for inline code notes (i played around with
converting from live script to .m file with fancy markdown and it didn't
work as well as expected
- we will be submitting raw code anyway so editing .m files (and converting
to .mlx files when necessary) would be more ideal
%}

% Since this is .m file, outputs to command window
a = [3 3 3 2 1 0 -1 -2 -2 -2];
a

% Plots not to command window (hexagram best marker)
figure
plot(a, "-hexagram")

figure
plot(cumsum(a), "-o")

%% Design 0
close all;
clear;

x = 115;

y_left = (720-x)/3;
y_right = (x+480)/3;

shear = zeros(1, 16);
shear(1) = 0;
shear(16) = 0;

x_shear = [0, 0, x+52, x+52, x+52+176, x+52+176, x+392, x+392, x+568, x+568, x+732, x+732, x+908, x+908, 1200, 1200];

for i = 1:7
    shear(2*i) = y_left - (200/3)*(i-1);
    shear(2*i+1) = y_left - (200/3)*(i-1);
end
shear;

moment = zeros(1,8);

moment(1) = 0;
moment(8) = 0;

x_moment = [0, x+52, x+52+176, x+392, x+568, x+732, x+908, 1200];


for i = 2:7
    x_val = (x_shear((i-1)*2+1)) - x_shear((i-1)*2-1);
    moment(i) = moment(i-1) - (shear((i-1)*2 + 1) * x_val);
end

moment;

figure
plot(x_shear, shear)
yline(0)
xlabel("X Values(mm)")
ylabel("Shear Force(N)")
title("SFD")

figure
plot(x_moment, moment)
yline(0)
xlabel("X Values(mm)")
ylabel("BendingMoment(N.mm)")
title("BMD")

%% Questions
%{
- can we still assume that the distance between the diaphragms is 400 despite the double diaphragm on the left/right end
- Table 30.2 ea 7, is the vertical direction not supported?
- is Q(x) the maximum?
- can we just ignore the top flange if we design it out
%}
