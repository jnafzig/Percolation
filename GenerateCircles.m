function [x_positions,y_positions] = GenerateCircles(Radius, Area)
%Function to randomly create the circles.  Radius is a defined constant in
%the body of the code.  Area is referring to the occupation density of the
%circles relative to the interaction area (our Xi)

%Output are the number of circles and the two arrays sorted in x for the centers of the circles

Number_Circles = floor(Area/(pi*Radius^2)); % number of circles

x_positions = sort(rand(Number_Circles,1)); 
y_positions = rand(Number_Circles,1); 
