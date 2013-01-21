function [X, y, w] = generate_data(N, classify=false)
  X = [ones(N,1), 2*rand(N, 2) - 1]; % N random row vectors
  p = 2*rand(2) - 1; %two points to define a line as separator
  w = plane_from_points(p); %find the w that determines the line, [1,p]*w = 0, using rows as points
  y = X*w;
  if(classify)
    y = sign(y);
  end
end