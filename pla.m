function [ws, es] = pla(X, y)
  ws=[];
  es = [];
  error_count = length(y);
  errors = 1:error_count;
  w = [1,0,0]';
  classes = sign(y);
  while(error_count > 0)
    i = errors(randi(error_count));
    w = w + classes(i)*X(i,:)';
    guess = sign(X*w);
    errors = find(classes != guess);
    error_count = length(errors);
    ws=[ws,w];
    es=[es,error_count];
  end
end
  
