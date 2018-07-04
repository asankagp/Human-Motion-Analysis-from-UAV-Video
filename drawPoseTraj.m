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

function drawPoseTraj(predictedLabels)
% Reconstructing the 3D pose and trajectory

sx = 0; % Step size for x direction
sy = 0; % Step size for y direction
x_center = 0; % Centre of the rotation
y_center = 0; % Centre of the rotation
d = 0.16; % Distance to be moved at each pose change
v=0; % 'v' is used to obtain the correct view of the 3D skeleton (after plotting the skeleton).

load skel3D % Load 3D skeletons 
Skel3Dplot1=Skel3Dplot; % Copy the cordinates - to rotate/move
load('tr_dataset'); %'tr_dataset' is used to map the predicted labels to its corresponding pose and viewpoint.


%% Determine the initial rotation of the skeleton
theta = initialTheta(predictedLabels(1,:));

%% Rotate the first skeleton by theta
Skel3Dplot1=skelRotate(Skel3Dplot1,theta,x_center,y_center);

%% Pre-cache data
pre_L = str2num(predictedLabels(1,:));
previous_view = str2num(tr_dataset(pre_L,2:3));% tr_dataset gives relevant pose and viewpoint
previous_pose = str2num(tr_dataset(pre_L,5:6));
current_pose = previous_pose;
 
%%
for i=1:size(predictedLabels,1)
    pre_L = str2num(predictedLabels(i,:));
    
    current_view = str2num(tr_dataset(pre_L,2:3));
    current_pose = str2num(tr_dataset(pre_L,5:6));

% Show the original image    
    ori_image=strcat('.\images\frame',sprintf('%04d.jpg',i));
    figure(1),subplot(2,2,1),imshow(ori_image),title(['Ori. Image: frame',sprintf('%04d.jpg',i)])
    
%% Estimate the trajectory  
    if(current_pose~=previous_pose) % Pose change
        if(current_view==previous_view)% No rotation, move straight
            theta = 0;
            [sx,sy,v] = skelMove(current_view,d);
        else % Rotate +/- 45 degress, and move (along the diagonal)
            if (current_view-previous_view==1)||((current_view==1)&&(previous_view==8))
                theta=-pi/4; % Rotate anticlockwise
                [sx,sy,v] = skelMove(current_view,d);
            else
                theta=pi/4; % Rotate clockwise
                [sx,sy,v] = skelMove(current_view,d);
            end
        end

        index = current_pose; % 'index' variable is used to extract the correct cordinates from 'Skel3Dplot' and 'Skel3Dplot1'. 

%% Adjust the cordinates
        Skel3Dplot1=skelRotate(Skel3Dplot1,theta,x_center,y_center); % Rotate by theta
        if(abs(sx)==d && abs(sy)==d) % If moving diagonally for 'd' distance
            sx=sx/1.414;
            sy=sy/1.414;
        end
        Skel3Dplot1(1:13,:)=Skel3Dplot1(1:13,:)-sx; % Moving a step size of sx
        Skel3Dplot1(14:26,:)=Skel3Dplot1(14:26,:)-sy; % Moving a step size of sy

%% Plot skeletons with markers
        figure(1), subplot(2,2,[3 4]), PlotSkeleton3D(Skel3Dplot1(:,index)),...
            title('Estimated trajectory. Red/Blue:right/left sides of body. Markers give foot touching locations.')
        set(gca,'YTickLabel',[],'XTickLabel',[],'ZTickLabel',[]) % No label, only grid
        hold on
        drawMarkers(Skel3Dplot1,index) % Draw markers when index is 1 or 5
        view([0 30])
        
        figure(1),subplot(2,2,2), PlotSkeleton3D(Skel3Dplot(:,index)),title('Estimated pose')
        set(gca,'YTickLabel',[],'XTickLabel',[],'ZTickLabel',[]) % No label, only grid
        view([v 30])

        pause(0.1)

%%
        previous_view = current_view;
        previous_pose = current_pose;
        
% Choose the point for the center of rotation. Accumulate each step (sx and sy). This step is needed to rotate the skeleton around the most recent x-y location.
        x_center = x_center-sx;
        y_center = y_center-sy; 
    end
end
end