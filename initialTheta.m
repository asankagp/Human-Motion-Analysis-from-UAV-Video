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

function [theta] = initialTheta(fistLabel)
% Determine the initial rotation of the skeleton
firstLabel = sscanf(fistLabel, '%d');

switch firstLabel
    case {1,2,3,4,5,6,7,8}
        theta = 0; 
    case {9,10,11,12,13,14,15,16}
        theta = -pi/4; 
    case {17,18,19,20,21,22,23,24}
        theta = -pi/2; 
    case {25,26,27,28,29,30,31,32}
        theta = -3*pi/4; 
    case {33,34,35,36,37,38,39,40}
        theta = pi;
    case {41,42,43,44,45,46,47,48}
        theta = 3*pi/4; 
    case {49,50,51,52,53,54,55,56}
        theta = pi/2; 
    case {57,58,59,60,61,62,63,64}
        theta = pi/4; 
end

end