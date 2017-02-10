function MoneyPlotter(C_matrix,cluster_groups,Radius,x_positions,y_positions)

Ncluster=max(cluster_groups);

clf;
hold on
for j = 1:Ncluster
    ColMap = [.8*rand,.8*rand,.5];
    cluster = cluster_groups==j;
    i = find(cluster)';
    DrawCircles(x_positions(i),y_positions(i),Radius,20,ColMap);
%     gplot(C_matrix(cluster,cluster),[x_positions(cluster),y_positions(cluster)]);
end
xlim([0,1]);ylim([0,1]);
axis square
axis off;
hold off;
