% This script plots pictures of randomly thrown circles. 
% R controls the size of circles but, A controls the
% density of circles.  Circles are colored according to the cluster they
% belong to and a voronoi diagram is drawn on top of the circles.

tic;
R = 0.04;    
A = 1;
tic;
% generate circles
[x,y] = GenerateCircles(R,A);

% build C matrix
C = ConnectivityMatrix(R,x,y);

% find clusters
clusters = ClusterFinder(C);
Nclusters = max(clusters);

MoneyPlotter(C,clusters,R,x,y);
toc;
hold on;
tic
voronoi(x,y,'k');
toc;

