function [X, y, w] = generate_data(N, classify=false)
  X = [ones(N,1), 2*rand(N, 2) - 1]; %100 column vectors
  p = 2*rand(2) - 1; %two points to define a line as separator
  w = planerot([0,1]) * (p(1,:) - p(2,:))'; % rotate vector 90 degrees so it's orthogonal to line
  w = w / norm(w); %normalize so we have a unit vector
  w0 = -dot(w, p(1,:)); % distance of line from origin, bias point is negative of that
  w = [w0; w]; %complete set of weights
  y = X*w;
  if(classify)
    y = sign(y);
  end
end