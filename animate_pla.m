function animate_pla(X, y, ws, es)
  figure(2);
  plot(es);
  for i = 1:length(ws)
    w = ws(:,i);
    plot_Xy(X, sign(y));
    plot_w(w);
    usleep(500);
  end
end
