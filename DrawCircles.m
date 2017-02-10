function DrawCircles(Xcenters,Ycenters,r,Npoints,color)
%---------------------------------------------------------------------------------------------
% DRAWCIRCLES Draw a bunch of circles
%
%---------------------------------------------------------------------------------------------



Ncenters = length(Xcenters);
assert(Ncenters==length(Ycenters));

angle=linspace(0,2*pi,Npoints)';
radius=ones(Npoints,1)*r;
[X,Y] = pol2cart(angle,radius);

Xvals = X(:,ones(1,Ncenters))+Xcenters(:,ones(1,Npoints))';
Yvals = Y(:,ones(1,Ncenters))+Ycenters(:,ones(1,Npoints))';

patch(Xvals,Yvals,color,'EdgeColor','None');
