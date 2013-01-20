function plot_Xy(X, y)
  figure(1)
  hold off
  scatter(X(:,2), X(:,3), 20, y)
  axis([-1.2, 1.2, -1.2, 1.2], "square")
end
