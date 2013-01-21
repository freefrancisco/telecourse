function [cmin, c1, crand] = flip_coins(ncoins, nflips, ntimes)

  %analytic solution
  flip_cdf = binocdf(0:nflips, nflips, 0.5); % p of n heads or less in nflips of a coin
  sample_cdf = 1 - realpow(1-flip_cdf, ncoins); % p of seeing n heads or less in for all coins
  expected_distribution = [sample_cdf(1), diff(sample_cdf)];
  expected_cmin = dot(expected_distribution, 0:nflips)
  
  %computation
  c1=[];
  crand=[];
  cmin=[];
  for(i = 1:ntimes)
    flips = randi(2, ncoins, nflips) - 1;  % 1s are heads, 0s are tails
    counts = flips*ones(nflips,1); %count the number of heads
    c1 = [c1,counts(1)];
    crand = [crand, counts(randi(ncoins))];
    cmin = [cmin, min(counts)];
  end
  cmin = mean(cmin)
  c1 = mean(c1)
  crand = mean(crand)
end
