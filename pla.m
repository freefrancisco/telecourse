function [es, ws] = pla(X, y, method="zeros")
  es = [];
  ws = [];
  error_count = length(y);
  errors = 1:error_count;
  switch method
  case "random"
    w = random_linear_separator(2);
  case "regression"
    w = pinv(X)*y;
  otherwise % zeros
    w = [1; 0; 0];
  end
  classes = sign(y);
  while(error_count > 0)
    i = errors(randi(error_count));
    w = w + classes(i)*X(i,:)';
    guess = classify(X, w);
    errors = find(classes != guess);
    error_count = length(errors);
    ws=[ws,w];
    es=[es,error_count];
  end
end
  
