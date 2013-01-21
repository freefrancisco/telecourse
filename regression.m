err_in = [];
err_out = [];

for i = 1:1000

  f = random_linear_separator(2); % target function
  X_in = random_points(100, 2); % X in sample
  y_in = classify(X_in, f); % y in sample

  g = pinv(X_in)*y_in; % regression here

  y_est = classify(X_in, g); %estimated y
  e_in = length(find(y_est != y_in)) / length(y_in); % error rate in sample
  err_in = [err_in, e_in];

  % plot_Xy(X_in, y_in);
  % plot_w(f, "black");
  % plot_w(g, "green", true);
  % pause

  X_out = random_points(1000, 2); % X out of sample
  y_out = classify(X_out, f);

  y_est = classify(X_out, g);
  e_out = length(find(y_est != y_out)) / length(y_out); % error rate out of sample
  err_out = [err_out, e_out];

  % plot_Xy(X_out, y_out);
  % plot_w(f, "black");
  % plot_w(g, "green", true);
end
figure(1)
hist(err_in)
figure(2)
hist(err_out)

mean(err_in)
mean(err_out)

