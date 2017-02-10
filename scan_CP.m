% This script is a scan to find the critical point for percolation
%
% Overview:
% For each density of circles, A, make Nsample random samples.  Check to
% see if there is a spanning cluster and keep track of the experimental
% probability of find such a cluster.

Nscan = 20;  %How many Xi values to scan in the range defined in A
Nsample = 10;   %Number times test spanning after random generation (for probability)
R = .01;   %Radius of the circles 
A = linspace(.8,1.5,Nscan);  %The density parameter (min, max, divisions)

% Allocate storage
spans = zeros(Nsample,1);
spanning_probability = zeros(Nscan,1);

% display:   3_9DG: segment was iteration, but this is misleading as Nscan
% not Niter
fprintf('  segment          Probability    Density   \n');
fprintf('-------------------------------------------\n');

for i = 1:Nscan
    for j = 1:Nsample
        % generate circles
        [x,y] = GenerateCircles(R,A(i));
        %3_9DG: May be neat to track how # circles changes...
        
        % build C matrix
        C = ConnectivityMatrix(R,x,y);
        
        % find clusters
        clusters = ClusterFinder(C);
        
        % determine if spanning cluster exists
        spans(j) = SpanningCluster(x,y,clusters,R);
        
    end
    
    % calculate probabilities
    spanning_probability(i) = sum(spans)/Nsample;
    
    fprintf('%7.0d%20.2f%13.2f\n',i,spanning_probability(i), A(i));
    
end

% plot results
plot(A,spanning_probability,'-*');