% -------------------------------------------------------------------------
% % Copyright (C) 2018 Asanka G. Perera, University of South Australia.
% 
% This program is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% any later version.
% 
% -------------------------------------------------------------------------
% If you use this code please cite the following paper:
% 
% Asanka G. Perera, Yee Wei Law, Ali Al-Naji, Javaan Chahl, (2018) 
% "Human motion analysis from UAV video", International Journal of 
% Intelligent Unmanned Systems, Vol. 6 Issue: 2, pp.69-92, 
% https://doi.org/10.1108/IJIUS-10-2017-0012
%
% email: asanka.perera@mymail.unisa.edu.au
% code URL: https://github.com/asankagp/Human-Motion-Analysis-from-UAV-Video
% -------------------------------------------------------------------------

function Skel3Dplot1 = skelRotate(Skel3Dplot1,theta,x_center,y_center)
% Rotate the skeletons by theta
for p=1:8
    xd=Skel3Dplot1(1:13,p)';
    yd=Skel3Dplot1(14:26,p)';
    xyd = [xd; yd];

    center = repmat([x_center; y_center], 1, length(xd));
    % define a theta degree counter-clockwise rotation matrix
    R = [cos(theta) -sin(theta); sin(theta) cos(theta)];
    % do the rotation...
    s = xyd - center;   % shift points in the plane so that the center of rotation is at the origin
    so = R*s;           % apply the rotation about the origin
    vo = so + center;   % shift again so the origin goes back to the desired center of rotation

    Skel3Dplot1(1:13,p) = vo(1,:)';
    Skel3Dplot1(14:26,p) = vo(2,:)';
end