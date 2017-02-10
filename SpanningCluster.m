function [ spans ] = SpanningCluster( x,y, cluster_groups,R)
%SPANNINGCLUSTER Find out whether there is a spanning cluster.
%   

Number_Clusters = max(cluster_groups);
spans = false;

for i = 1:Number_Clusters
    y_max = max(y(cluster_groups==i));
    y_min = min(y(cluster_groups==i));
    x_max = max(x(cluster_groups==i));
    x_min = min(x(cluster_groups==i));
    
    if (y_max>(1-R) && y_min<R) || (x_max>(1-R) && x_min<R)
        spans = true;
    end
end
    
end

