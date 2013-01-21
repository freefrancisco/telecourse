function h = plot_separator(fun, color="black")
  hold on;
  f = @(x, y) prepare_for_ezplot(x, y, fun);  
  h = ezplot(f);
  set(h, "linewidth", 4);
  set(h, "color", color);
  hold off;
end
