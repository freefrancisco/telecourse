% non linear data, uses transformation to fit linear regression in

f_separator = @(x) (x.*x)*[0;1;1] - 0.6; % separator function, the step of which defines the target function
target = @(x) sign( f_separator(x) ); % target function, separates the two classes
noise = @(y)  y .* sign(rand(size(y)) - 0.1); % random noise function of one variable, apply to target function
f = @(x) noise( target(x) ); %compose the two functions, here is where we actually apply noise to clean target
err = @(y1, y2)  length(find(y1 != y2)) / length(y2); % error rate for classification
featurize = @(x) [x,x(:,2).*x(:,3), (x.*x)(:,2:3)]; %implements (x, y)-> (1, x, y, xy, x^2, y^2)

err_in = [];
err_out = [];
err_ratio = [];
gs = [];

max_iter = 30;

for i = 1:max_iter
  iteration = i 
  N_in=30 %in sample data to generalize from
  N_out = 1000;  % out of sample data to check generalization
  % in sample data
  X_in = random_points(N_in, 2);  % in sample data
  y_in = f(X_in); % noisy outputs from data
  % learning steps
  if(iteration == max_iter)
    g = mean(gs,2) % let's see how the average g fares against the individual gs
  else
    g = pinv( featurize(X_in) ) * y_in % regression on featurized input and noisy target function
  end
  gs = [gs, g]; % save all my intermedate gs
  g_separator = @(x) featurize(x) * g;  % separator function estimated by regression
  g_classify = @(x) sign( g_separator(x) ); % classifier resulting from regression  
  % in sample testing
  y_est = g_classify(X_in); % estimated outputs by regression classifier
  in_sample_error = err(y_est, y_in) % in sample error for binary function
  err_in = [err_in, in_sample_error]; % error rate in sample
  % visualize in sample
  plot_Xy(X_in, y_in); %plot data with labels
  plot_separator(f_separator, "green"); %plot my original target function using the separator
  plot_separator(g_separator, "black"); %plot the regresion's estimation of the target function
  % pause
  usleep(500)
  % out of sample data
  X_out = random_points(N_out, 2); % out of sample data
  y_out = f(X_out);  % noisy outputs from data
  % out of sample testing
  y_est = g_classify(X_out); % estimated outputs by regression classifier
  out_of_sample_error = err(y_est, y_out) % out of sample error for binary function  
  err_out = [err_out, err(y_est, y_out)]; % error rate out of sample
  error_ratio = in_sample_error / out_of_sample_error
  err_ratio = [err_ratio, error_ratio];  
  % visualize out of sample
  plot_Xy(X_out, y_out); 
  plot_separator(f_separator, "green");
  plot_separator(g_separator, "black");
  % pause
  usleep(500)
end
"."
"."
"Done!"
"."
avg_in_sample_error = mean(err_in(1:end-1))
avg_out_of_sample_error = mean(err_out(1:end-1))
avg_error_ratio = mean(err_ratio(1:end-1))
ratio_of_avg_errors = avg_in_sample_error / avg_out_of_sample_error
avg_g = g


figure(2)
hist(err_in)
figure(3)
hist(err_out)
figure(4)
hist(err_ratio)


