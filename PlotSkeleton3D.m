%{
%-----------------------------------------------------------------------
% Randomized Hierarchical Cascades of Rejectors
%-----------------------------------------------------------------------

% Copyright (C) 2013 Gregory Rogez
% Universidad de Zaragoza, Zaragoza, Spain.

% This program is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation. See http://www.gnu.org/copyleft/gpl.html for details

% If you use this code for academic work, please reference:
%   Grégory Rogez, Jonathan Rihan, Carlos Orrite-Uruñuela, Philip H. S. Torr,
%   Fast Human Pose Detection Using Randomized Hierarchical Cascades of Rejectors.
%   International Journal of Computer Vision 99(1): 25-52 (2012)

%-----------------------------------------------------------------------
% Authors:  Grégory Rogez -- grogez@unizar.es

% Aragón Institute for Engineering Research (I3A)
% Universidad de Zaragoza, 50018, Zaragoza, Spain
% Date   :  February 2013
%-----------------------------------------------------------------------
%}
function PlotSkeleton3D(Skeleton,lineWidth,markerSize, col, col1, col2, col3)

if nargin<4
    col='blue';
    col1='blue';
    col2='red';
    col3='black';
end
if nargin<2
    lineWidth=3;
end
if nargin<3
    markerSize=20;
end
numJoints =length(Skeleton);

xs = Skeleton(1:numJoints/3);
ys = -Skeleton(numJoints/3+1:2*numJoints/3);
zs = -Skeleton(2*numJoints/3+1:numJoints);

plot3(xs(1:12),ys(1:12),zs(1:12),'.','color',col3,'MarkerSize',markerSize);
hold on
plot3(xs(13),ys(13),zs(13),'.','color','black','MarkerSize',30);
hold off

h=line([xs(1),xs(3)],[ys(1),ys(3)],[zs(1),zs(3)]);
set(h,'color',col1, 'LineWidth',lineWidth);
h=line([xs(2),xs(4)],[ys(2),ys(4)],[zs(2),zs(4)]);
set(h,'color',col2, 'LineWidth',lineWidth);
h=line([xs(4),xs(6)],[ys(4),ys(6)],[zs(4),zs(6)]);
set(h,'color',col2, 'LineWidth',lineWidth);
h=line([xs(3),xs(5)],[ys(3),ys(5)],[zs(3),zs(5)]);
set(h,'color',col1, 'LineWidth',lineWidth);
h=line([xs(5),xs(6)],[ys(5),ys(6)],[zs(5),zs(6)]);
set(h,'color','black', 'LineWidth',lineWidth);
h=line([(xs(5)+xs(6))/2,(xs(11)+xs(12))/2],[(ys(5)+ys(6))/2,(ys(11)+ys(12))/2],[(zs(5)+zs(6))/2,(zs(11)+zs(12))/2]);
set(h,'color','black', 'LineWidth',lineWidth);
h=line([xs(11),xs(12)],[ys(11),ys(12)],[zs(11),zs(12)]);
set(h,'color','black', 'LineWidth',lineWidth);
h=line([xs(11),xs(9)],[ys(11),ys(9)],[zs(11),zs(9)]);
set(h,'color',col1, 'LineWidth',lineWidth);
h=line([xs(9),xs(7)],[ys(9),ys(7)],[zs(9),zs(7)]);
set(h,'color',col1, 'LineWidth',lineWidth);
h=line([xs(12),xs(10)],[ys(12),ys(10)],[zs(12),zs(10)]);
set(h,'color',col2, 'LineWidth',lineWidth);
h=line([xs(10),xs(8)],[ys(10),ys(8)],[zs(10),zs(8)]);
set(h,'color',col2, 'LineWidth',lineWidth);
h=line([xs(13),(xs(11)+xs(12))/2],[ys(13),(ys(11)+ys(12))/2],[zs(13),(zs(11)+zs(12))/2]);
set(h,'color','black', 'LineWidth',lineWidth);
axis equal
grid on
view(2)

