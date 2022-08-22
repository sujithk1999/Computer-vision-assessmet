function [SRE,LRE,GLN,RP,RLN,LGRE,HGRE]  = glrlm(image,quantize,mask)

% texture feature of glrl
%
%     SHORT RUN EMPHASIS (SRE) 
%    LONG RUN EMPHASIS(LRE)
%    GRAY LEVEL NON-UNIFORMITY (GLN)
%    RUN PERCENTAGE (RP)
%     RUN LENGTH NON-UNIFORMITY (RLN)
%     LOW GRAY LEVEL RUN EMPHASIS (LGRE)
%   HIGH GRAY LEVEL RUN EMPHASIS (HGRE)
%

% (c) Wout Oude Elferink, 13-5-2015
% University Of Twente, The Netherlands

% if the color => making gray scale
if size(image,3)>1
   image = im2gray(image); 
end

image = im2double(image); % make double

% crop down the image to get mask bound for fast process
stati = regionprops(mask,'BoundingBox');
cx = int16(floor(stati.BoundingBox)) + int16(floor(stati.BoundingBox)==0);
image = image(cx(2):cx(2)+cx(4)-1,cx(1):cx(1)+cx(3)-1);
mask = mask(cx(2):cx(2)+cx(4)-1,cx(1):cx(1)+cx(3)-1);

% adjusting the range
minimum = min(image(:));   % finding the minimum
image = image-minimum;       % let range start at 0
maximum = max(image(:));   % finding the maximum

% quantize the image for making discrete integer values 
level1 = maximum/quantize:maximum/quantize:maximum-maximum/quantize;
image = imquantize(image,level1);

% apply  mask
image(~mask) = 0;

% initializing glrlm: p(i,j)
% -  i the amount of bin value (quantization levels)
% -   j the max run len. 
% -  the four diff orientation are used (0 deg, 45 deg, 90 deg and 135 degree)
p0_deg = zeros(quantize,max(size(image)));
p45_deg = zeros(quantize,max(size(image)));
p90_deg = zeros(quantize,max(size(image)));
p135_deg = zeros(quantize,max(size(image)));

% initialize the maxi value for j
max_image = max(size(image));

% adding the zeros to the borders
image = padarray(image,[1 1]);

% initialization of  rotation
image45 = imrotate(image,45);

% finding run length for every quantize level
for i = 1:quantize
    % finding the pixels which are corresponding to the quantize level
    BWs = int8(image == i);
    BWr = int8(image45 == i);    
    
    % find the start point and end points of the gray level run length
    G_0e = (BWs(2:end-1,2:end-1) - BWs(2:end-1,3:end)) == 1;
    G_0s = (BWs(2:end-1,2:end-1) - BWs(2:end-1,1:end-2)) == 1;
    G_45e = (BWr(2:end-1,2:end-1) - BWr(2:end-1,3:end)) == 1;
    G_45s = (BWr(2:end-1,2:end-1) - BWr(2:end-1,1:end-2)) == 1;
    G_90e = (BWs(2:end-1,2:end-1) - BWs(3:end,2:end-1)) == 1;
    G_90s = (BWs(2:end-1,2:end-1) - BWs(1:end-2,2:end-1)) == 1;
    G_135e = (BWr(2:end-1,2:end-1) - BWr(3:end,2:end-1)) == 1;
    G_135s = (BWr(2:end-1,2:end-1) - BWr(1:end-2,2:end-1)) == 1;
    
    % finding all indexes
    G_0s = G_0s'; G_0s = find(G_0s(:));
    G_0e = G_0e'; G_0e = find(G_0e(:));
    G_45s = G_45s'; G_45s = find(G_45s(:));
    G_45e = G_45e'; G_45e = find(G_45e(:));
    G_90s = find(G_90s(:));
    G_90e = find(G_90e(:));
    G_135s = find(G_135s(:));
    G_135e = find(G_135e(:));
 
    % finding all lengths
    length_0deg = G_0e - G_0s + 1;
    length_45deg = G_45e - G_45s + 1;
    length_90deg = G_90e - G_90s + 1;
    length_135deg = G_135e - G_135s + 1;
    
    % filling matrix
    p0_deg(i,:) = hist(length_0deg,1:max_image);
    p45_deg(i,:) = hist(length_45deg,1:max_image);
    p90_deg(i,:) = hist(length_90deg,1:max_image);
    p135_deg(i,:) = hist(length_135deg,1:max_image);    
end

% adding orientations
posi = p0_deg + p45_deg + p90_deg + p135_deg;

% calculating the features
total_Sum = sum(posi(:));
SRE = sum(sum(posi,1) ./ ((1:max_image).^2)) / total_Sum;
LRE = sum(sum(posi,1) .* ((1:max_image).^2)) / total_Sum;
RLN = sum(sum(posi,1) .^2) / total_Sum;
RP = total_Sum / sum(mask(:));
GLN = sum(sum(posi,2) .^2) / total_Sum;
LGRE = sum(sum(posi,2) .* ((1:quantize)'.^2)) / total_Sum;
HGRE = sum(sum(posi,2) .^2) / total_Sum;
end




    