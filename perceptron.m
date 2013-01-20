1; 

[X, y, w] = generate_data(200);
% plot_Xy(X, y);
plot_Xy(X, sign(y));
plot_w(w);  % plot the original separator
[ws, es] = pla(X, y);
printf("press enter to see animation of pla working");
pause
animate_pla(X, y, ws, es);
