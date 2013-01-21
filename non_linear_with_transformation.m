err_in = [];
err_out = [];
gs = [];

f_clean = @(x) sign( (x.*x)*[0;1;1] - 0.6 ); % target function
noise = @(y)  y .* sign(rand(size(y)) - 0.1); % random noise function
f = @(x) noise( f_clean(x) ); %compose the two functions

err = @(y1, y2)  length(find(y1 != y2)) / length(y2); % error rate

featurize = @(x) [x,x(:,2).*x(:,3), (x.*x)(:,2:3)];


for i = 1:1000
  
  N=1000;
  N_space = 1000;

  X_in = random_points(N, 2);  
  y_in = f(X_in);
  Z_in = featurize(X_in);
  g = pinv(Z_in)*y_in; % regression
  gs = [gs, g];
  y_est = classify(Z_in, g); %estimated y
  err_in = [err_in, err(y_est, y_in)]; % error rate in sample

  % plot_Xy(X_in, y_in);
  % plot_w(g, "green", true);
  % pause

  X_out = random_points(N_space, 2); % X out of sample
  y_out = f(X_out);  
  Z_out = featurize(X_out);
  y_est = classify(Z_out, g);
  err_out = [err_out, err(y_est, y_out)]; % error rate out of sample

  % plot_Xy(X_out, y_out);
  % plot_w(g, "green", true);
  % pause
  
end

mean(err_in)
mean(err_out)
w1 = gs(:,1)
w2 = mean(gs,2)

figure(2)
hist(err_in)
figure(3)
hist(err_out)


