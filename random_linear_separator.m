function w = random_linear_separator(dimensions, range=[-1, 1])
  p = range(1) + diff(range)*rand(dimensions); %n points in n-space define a linear separator
  w = plane_from_points(p); %find the w that determines the line, [1,p]*w = 0, using rows as points
end