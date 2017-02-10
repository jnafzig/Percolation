% This script scans over the density parameter, A and counts the number of
% clusters at each density.

Nscan = 100;  % will need to vary R so that it is R(i)
R = .005;     % radius of circles.  (choosing smaller circles will mean 
              %more circles
A = linspace(.05,2,Nscan);

% lets store the number of clusters at each iteration.
Number_Clusters = zeros(Nscan,1);

% display:
fprintf('  iteration       Number of Clusters       \n');
fprintf('-------------------------------------------\n');

for i = 1:Nscan
        
    % generate random circles
    [x,y] = GenerateCircles(R,A(i));

    % build C matrix
    C = ConnectivityMatrix(R,x,y);

    % find clusters        
    clusters = ClusterFinder(C);
    
    Number_Clusters(i) = max(clusters); 
    
    fprintf('%7.0d%20.0d\n',i,Number_Clusters(i));
    
end

plot(A,Number_Clusters,'*');


