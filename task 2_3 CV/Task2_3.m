clc
clear all
close all

image = imread('ImgPIA.jpg');
image = rgb2gray(image);

%glrlm toolbox is used for determining the features of the GLRLM

%bits_depth_image = 2

bits_depth_of_image = 2;
mask = ones(size(image(:,:,1)));

[SRE,LRE,GLN,RP,RLN,LGRE,HGRE] = glrlm(image,bits_depth_of_image,mask);
y = [SRE LRE GLN RP RLN LGRE HGRE];
x = categorical({'SRE','LRE','GLN','RP' ...
    , 'RLN', 'LGRE', 'HGRE'});
x = reordercats(x,{'SRE','LRE','GLN','RP', 'RLN', 'LGRE', 'HGRE'});
subplot(2,3,1)
bar(x,y)
title('Bit_depth_image at 2')


%bits_depth_image = 4

bits_depth_of_image = 4;
mask = ones(size(image(:,:,1)));

[SRE,LRE,GLN,RP,RLN,LGRE,HGRE] = glrlm(image,bits_depth_of_image,mask);
y = [SRE LRE GLN RP RLN LGRE HGRE];
x = categorical({'SRE','LRE','GLN','RP' ...
    , 'RLN', 'LGRE', 'HGRE'});
x = reordercats(x,{'SRE','LRE','GLN','RP', 'RLN', 'LGRE', 'HGRE'});
subplot(2,3,2)
bar(x,y)
title('Bit_depth_image at 4')

%bits_depth_image = 6

bits_depth_of_image = 6

[SRE,LRE,GLN,RP,RLN,LGRE,HGRE] = glrlm(image,bits_depth_of_image,mask);
y = [SRE LRE GLN RP RLN LGRE HGRE];
x = categorical({'SRE','LRE','GLN','RP' ...
    , 'RLN', 'LGRE', 'HGRE'});
x = reordercats(x,{'SRE','LRE','GLN','RP', 'RLN', 'LGRE', 'HGRE'});
subplot(2,3,3)
bar(x,y)
title('Bit_depth_image at 6')

%bits_depth_image = 8

bits_depth_of_image = 8;

[SRE,LRE,GLN,RP,RLN,LGRE,HGRE] = glrlm(image,bits_depth_of_image,mask);
y = [SRE LRE GLN RP RLN LGRE HGRE];
x = categorical({'SRE','LRE','GLN','RP' ...
    , 'RLN', 'LGRE', 'HGRE'});
x = reordercats(x,{'SRE','LRE','GLN','RP', 'RLN', 'LGRE', 'HGRE'});
subplot(2,3,4)
bar(x,y)
title('Bit_depth_image at 8')
