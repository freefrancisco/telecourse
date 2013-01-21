function h = plot_w(w, color="black", normal=false)
  figure(1)
  hold on
  h = ezplot(@(x, y) w(1) + w(2)*x + w(3)*y, [-1.2, 1.2, -1.2, 1.2]);
  set(h, "linewidth", 4);
  set(h, "color", color);
  if(normal)
    plot([0,w(2)], [0,w(3)], 'g-')
    scatter([0,w(2)], [0,w(3)], 20, 0)
  end
  hold off
end
