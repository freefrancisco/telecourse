%find equation for a n-1 dimensional hyperplane given n points determining a hyperplane in that space
%return vector w such that for any point x in plane [1, p]*w = 0, or p*w(2:end) = -w(1)
function w = plane_from_points(points) %assume points are row vectors
  p1 = points(1,:);
  vectors = points - repmat(p1, length(points), 1); % subtract one of the points from all points to get a basis
  vectors = vectors(2:end, :); % don't use the subtracted vector, it is zero now
  normal = null(vectors); %the null space of the vectors
  w0 = - dot(p1, normal); % find distance of plane from origin
  w = [w0; normal];
end
  