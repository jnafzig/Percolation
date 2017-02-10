function C_Matrix = ConnectivityMatrix(Radius,x_centers,y_centers)
%Construct the connectivity matrix.  We get the number of circles from the
%length of x_centers;

Number_Circles = length(x_centers);

% preallocate storage for indices of overlapping circles
ivals = zeros(floor(Number_Circles*log(Number_Circles)),1);
kvals = zeros(floor(Number_Circles*log(Number_Circles)),1);
svals = false(floor(Number_Circles*log(Number_Circles)),1);

ind = 0;
xmax_ind = 2;
for i = 1:(Number_Circles-1)
    
    xmax = x_centers(i)+2*Radius;
    while xmax_ind<=Number_Circles && x_centers(xmax_ind)<xmax
        xmax_ind=xmax_ind+1; 
    end
    
    j = i + 1:xmax_ind-1;
    
    ydif = abs(y_centers(j)-y_centers(i));
    
    k = find(ydif<2*Radius);
    if ~isempty(k)
        xdif = x_centers(j) - x_centers(i);
        
        len = length(k);
        ivals(ind+(1:len)) = i*ones(len,1);
        kvals(ind+(1:len)) = i+k;
        svals(ind+(1:len)) = sqrt(xdif(k).^2+ydif(k).^2)<2*Radius;
        ind = ind + len;
    end
end

last = find(ivals~=0,1,'last');
C_Matrix = sparse(ivals(1:last),kvals(1:last),svals(1:last),Number_Circles,Number_Circles);

C_Matrix = C_Matrix + C_Matrix' + speye(Number_Circles);


