function X = random_points(N, dimensions, range=[-1, 1])
  X = [ones(N,1), range(1) + diff(range)*rand(N, dimensions)]; % N random row vectors in range
end