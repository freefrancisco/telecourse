
hold off
% classify = @(point) sign(separator(1)+ separator(2:end)*point);
% classes = classify(points);

%generate_data: points as column vectors, a random separator, and a classification based on separator
function [points, classes, separator] = generate_data
  points = 2*rand(2,10)-1; %100 column vectors
  points_for_line = 2*rand(2) - 1; %two points to define a line as separator
  vector = planerot([0,1]) * (points_for_line(:,2) - points_for_line(:,1)); % orthogonal difference between points
  vector = vector / norm(vector); %normalize
  distance = dot(vector, points_for_line(:,1)); %bias point
  separator = [-distance, vector']; %form of perceptron
  classes = classify(points, separator);  
end

%classify: points are column vectors, perceptron is row
function classes = classify(points, perceptron) 
  classes = sign(perceptron(1) + perceptron(2:end)*points);
end

%plot_data: plot the data generated, color coded by class
function plot_data(points, classes)
  figure(1)
  hold off
  scatter(points(1,:), points(2,:), 20, classes)
  axis([-1.2, 1.2, -1.2, 1.2], "square")
end

%plot_classifier: plot the line and vector of classifier on top of data
function plot_classifier(classifier)
  figure(1)
  hold on
  ezplot(@(x, y) classifier(1) + classifier(2)*x + classifier(3)*y, [-1.2, 1.2, -1.2, 1.2])
  plot([0,classifier(2)], [0,classifier(3)], 'g-')
  scatter([0,classifier(2)], [0,classifier(3)], 20, 0)
  hold off
end

function [new_perceptron, error_count] = learn(old_perceptron, points, classes)
  guess = classify(points, old_perceptron);
  errors = find(classes!=guess);
  error_count = length(errors);
  if(error_count == 0)
    "DONE!!"
    new_perceptron = old_perceptron;
  else
    i = errors(randi(error_count));
    [i, classes(i), guess(i)]
    [1, points(:,i)']
    new_perceptron = old_perceptron + classes(i)*[1,points(:,i)'];
  end
  plot_data(points, classes);
  plot_classifier(new_perceptron);
end

function [classifier, errors] = run(classifier, points, classes, times)
  for i = 1:times
    [classifier, errors] = learn(classifier, points, classes)
    sleep(1)
  end
end


[points, classes, separator] = generate_data;

plot_data(points, classes)

plot_classifier(separator)

classifier = [0,0,0]

% sleep(2)
% 
% for i = 1:20
%   [classifier, errors] = learn(classifier, points, classes)
%   sleep(2)
% end


