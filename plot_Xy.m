function plot_Xy(X, y)
  graphics_toolkit ("fltk")
  figure(1)
  hold off
  scatter(X(:,2), X(:,3), 10, y, "filled")
  axis([-1.2, 1.2, -1.2, 1.2], "square")
end
