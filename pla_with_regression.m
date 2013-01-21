iter_regression = [];
iter_rand = [];
iter_zeros = [];

for i = 1:1000

  f = random_linear_separator(2); % target function
  X = random_points(10, 2); % X in sample
  y = classify(X, f); % y in sample
  
  ereg = pla(X, y, "regression");
  eran = pla(X, y, "random");
  ezer = pla(X, y, "zeros");
  
  iter_regression = [iter_regression, length(ereg)];
  iter_rand = [iter_rand, length(eran)];
  iter_zeros = [iter_zeros, length(ezer)];

end

figure(1)
hist(iter_regression)
figure(2)
hist(iter_rand)
figure(3)
hist(iter_zeros)

mean(iter_regression)
mean(iter_rand)
mean(iter_zeros)

