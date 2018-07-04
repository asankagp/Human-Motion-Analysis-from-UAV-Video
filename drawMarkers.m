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

function drawMarkers(Skel3Dplot1,index)
% Draw markers when index is 1 or 5
    if (index==1)
        centerX = Skel3Dplot1(2,index);%20;
        centerY = -Skel3Dplot1(15,index);%30;
        centerZ = -Skel3Dplot1(28,index);%30;
        r=0.04;
        teta=-pi:0.01:pi;
        x1=r*cos(teta)+centerX;
        y1=r*sin(teta)+centerY;
        z1=(teta*0)+centerZ;
        figure(1), fill3(x1, y1, z1, 'r', 'FaceAlpha', 0.2,'EdgeColor',[1 0 0])
    end
    if (index==5)
        centerX = Skel3Dplot1(1,index);%20;
        centerY = -Skel3Dplot1(14,index);%30;
        centerZ = -Skel3Dplot1(27,index);%30;
        r=0.04;
        teta=-pi:0.01:pi;
        x1=r*cos(teta)+centerX;
        y1=r*sin(teta)+centerY;
        z1=(teta*0)+centerZ;
        fill3(x1, y1, z1, 'b', 'FaceAlpha', 0.2,'EdgeColor',[0 0 1])
    end
    hold on
%     view([0 30])