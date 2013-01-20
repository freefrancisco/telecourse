1; 

[X, y, separator_w] = generate_data(200);
%or equivalently we could just use
regression_w1 = inv(X'*X)*X'*y; 
regression_w2 = pinv(X)*y;

[separator_w, regression_w1, regression_w2]
[regression_w1 - separator_w]
[regression_w2 - separator_w]
[regression_w2 - regression_w1]
% plot_Xy(X, y);

plot_Xy(X, y);
plot_w(separator_w);  % plot the original separator
pause
plot_Xy(X, y);
plot_w(regression_w1);  % plot the original separator
pause
plot_Xy(X, y);
plot_w(regression_w2);  % plot the original separator
% [ws, es] = pla(X, y);
% printf("press enter to see animation of pla working");
% pause
% animate_pla(X, y, ws, es);
