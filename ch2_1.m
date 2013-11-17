% load the data
% age, gender (0 = female), impressions, clicks, logged-in 
data1 = csvread('./nyt/nyt1.csv', 1, 0);

% 1
% this 
%ageRanges = [0, 18, 24, 34, 44, 54, 64, 200];
% this set of age ranges gives results like the R example in the book
ageRanges = [-Inf, 1, 19, 25, 35, 45, 55, 65, 200];

% ranges: [k, k+1)
[ageCounts, ageMap] = histc(data1(:, 1), ageRanges);

% show the distribution of age ranges
figure('name', 'User Counts by Age');
bar(ageCounts);

% 2: click through rate = (# clicks / # impressions)
impressions = accumarray(ageMap, data1(:, 3));
clicks = accumarray(ageMap, data1(:, 4));

% click through rate
ctr = clicks ./ impressions;

% impressions means
impressions ./ ageCounts(1:8)

% click means
clicks ./ ageCounts(1:8)

% overall histogram of impressions
[impressionCounts, impressionMap] = histc(data1(:, 3), 0:40);
%figure('name', 'User Counts by Impression');
%bar(impressionCounts);

ageImpressionGroup = [ageMap impressionMap];

ageImpression = accumarray(ageImpressionGroup, ones(length(ageImpressionGroup), 1));
figure('name', 'User Counts by Impression and Age');
bar(ageImpression', 'stacked');


