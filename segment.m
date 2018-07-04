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

function [im4] = segment(imOri)
%#codegen
a = 20; % Add an extra margin
        
img=im2bw(imOri,95/255); % Thresholding
img=~img; % Inverse the binary colors
   
rp = regionprops(img, 'BoundingBox', 'Area');
area = [rp.Area].';
[~,ind] = max(area); % Max area
bbx = rp(ind).BoundingBox;

% Crop with extra margin
xmin = bbx(1)-a;
ymin = bbx(2)-a;
width = bbx(3)+(2*a);
height = bbx(4)+(2*a);
img = imcrop(img, [xmin ymin width height]);

F_gau=fspecial('gaussian',3,2); %3x3 Gaussian filter s=2
im=imfilter(img,F_gau,'replicate'); 

im = bwareaopen(im,10); % Remove objects containing fewer than x pixels
rp = regionprops(im, 'BoundingBox', 'Area');
area = [rp.Area].';

% Select the max area
if size(area,1)==1 
%     [~,ind1] = max(area);%max area
    bb1 = rp(1).BoundingBox;
    im3 = imcrop(im,bb1);
    
% Select the max and second max areas    
else 
    [~,ind1] = max(area); % Max area
    area(ind1) = NaN;
    [~,ind2] = max(area); % Second max area
    bb1 = rp(ind1).BoundingBox; % ax bbox
    bb2 = rp(ind2).BoundingBox; % Second max bbox

    bb1=floor(bb1);
    bb2=floor(bb2);
    if bb1(1)==0
        bb1(1)=1;
    end
    if bb1(2)==0
        bb1(2)=1;
    end
    if bb2(1)==0
        bb2(1)=1;
    end
    if bb2(2)==0
        bb2(2)=1;
    end

    im1=im;
% Make the bb1 and bb2 areas zeros
    im1(bb1(2):bb1(2)+bb1(4),bb1(1):bb1(1)+bb1(3))=0;
    im1(bb2(2):bb2(2)+bb2(4), bb2(1):bb2(1)+bb2(3))=0;
    im2=im-im1; % Select only the max two areas
% Crop the ROI
    [xx,yy]=find(im2==1);
    max_x=max(xx); min_x=min(xx); max_y=max(yy); min_y=min(yy);
    im3=im2(min_x:max_x, min_y:max_y);
end
    
% Scale down to match the human height of training images and clean the
% edges
im4 = imresize(im3,[114 NaN]); 
[r, c] = size(im4);

if(c>96)
    im4 = imresize(im4,[NaN 96]);
    im4 = padarray(im4,[floor((160-r)/2) 0],'both'); 
else
% Fill with extra zeros- [height width] -both directions
    im4 = padarray(im4,[23 floor((96-c)/2)],'both'); 
end

im4 = im2uint8(im4); % Logical to uint8, to match with training images
im4 = imresize(im4,[160 96]);
% Clear any white pixels that surround the image border
im4 = imclearborder(im4);
end

