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

%% Questions
%{
- can we still assume that the distance between the diaphragms is 400 despite the double diaphragm on the left/right end
- Table 30.2 ea 7, is the vertical direction not supported?
%}
