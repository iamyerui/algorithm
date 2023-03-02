%% Good
N = 8; K = 4;
knots   = [0 0 0 linspace(0, 1, N-K+2) 1 1 1];
pts     = 0:0.01:1;
B       = gen_spline_basis(knots, pts);
plot(pts,B)

%%
x=[0 0.05 0.20 0.3 0.40 0.60 0.70 0.80]';
y=[0 0.20 0.35 0.4 0.42 0.43 0.44 0.45]';
plot(B*x, B*y, x, y, 'ro')

%%
x=[0 0.05 0.06 0.20 0.3 0.40 0.60 0.70]';
y=[0 0.20 0.19 0.35 0.4 0.42 0.43 0.44]';
plot(B*x, B*y, x, y, 'ro')

%%
% x=[0.05 0.20 0.3 0.40 0.60 0.70 0.80 0.90]';
% y=[0.20 0.35 0.4 0.42 0.43 0.44 0.45 0.45]';
% plot(B*x, B*y, x, y, 'r-o')

%%
x = [-0.1, 0.05, 0.06, 0.20, 0.3, 0.40, 0.41, 1.1]';
y = [-0.1, 0.20, 0.19, 0.35, 0.4, 0.42, 0.41, 0.43]';
plot(B*x, B*y, x, y, 'r*')

