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


clear all, close all

addpath('images') 

features = single(zeros(1,32292)); % Feature vector for a 96x160 image
classifier_name= char();
predictedLabels = char(); 

label='37'; % Initialized label

for x = 1 : 100
    
    imFile=sprintf('%s%04d.jpg', 'frame',x);
    img=imread(imFile);

    img=imcrop(img, [100 50 950 660]); % This is a customized step to remove a noisy area in scenario 2

    img = segment(img);

    features = extractFeatures(img);

    classifier_name =strcat('C4_classifiers\classifier',label,'.mat'); % Select the correct classifier

    label =predictPose(features,classifier_name);

    predictedLabels(x,:) = label;
end

drawPoseTraj(predictedLabels); % Reconstruct 3D pose and trajectory







