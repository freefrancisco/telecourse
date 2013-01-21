function result = prepare_for_ezplot(x, y, fun)
  sz = size(x);
  xx = x(:);
  yy = y(:);
  oo = ones(size(xx));
  result = fun([oo,xx,yy]);
  result = reshape(result, sz);
end
