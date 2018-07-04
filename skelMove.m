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

function [sx,sy,v] = skelMove(current_view,d)
% This function selects how much distance to be moved (straight or
% diagonally). 'v' is the variable that gives the viewpoint of the plotted
% 3D skeleton.
switch current_view
    case {1}
        sx = d;
        sy = 0;
        v=0;
    case {2}
        sx = d;
        sy = -d;
        v=315;
    case {3}
        sx = 0;
        sy = -d;
        v=270;
    case {4}
        sx = -d;
        sy = -d;
        v=225;
    case {5}
        sx = -d;
        sy = 0;
        v=180;
    case {6}
        sx = -d;
        sy = d;
        v=135;
    case {7}
        sx = 0;
        sy = d;
        v=90;
    case {8}
        sx = d;
        sy = d;
        v=45;
end

end