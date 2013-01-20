
hold off
% classify = @(point) sign(separator(1)+ separator(2:end)*point);
% classes = classify(points);

function [points, classes, separator] = generate_data
  points = 2*rand(2,10)-1; %100 column vectors
  points_for_line = 2*rand(2) - 1; %two points to define a line as separator
  vector = planerot([0,1]) * (points_for_line(:,2) - points_for_line(:,1)); % orthogonal difference between points
  vector = vector / norm(vector); %normalize
  distance = dot(vector, points_for_line(:,1)); %bias point
  separator = [-distance, vector']; %form of perceptron
  classes = classify(points, separator);  
end

function classes = classify(points, perceptron) %points are column vectors, perceptron is row
  classes = sign(perceptron(1) + perceptron(2:end)*points);
end


function plot_data(points, classes)
  figure(1)
  hold off
  scatter(points(1,:), points(2,:), 20, classes)
  axis([-1.2, 1.2, -1.2, 1.2], "square")
end

function plot_classifier(classifier)
  figure(1)
  hold on
  ezplot(@(x, y) classifier(1) + classifier(2)*x + classifier(3)*y, [-1.2, 1.2, -1.2, 1.2])
  plot([0,classifier(2)], [0,classifier(3)], 'g-')
  scatter([0,classifier(2)], [0,classifier(3)], 20, 0)
  hold off
end

[points, classes, separator] = generate_data;

plot_data(points, classes)

plot_classifier(separator)


