clear all
clc
Image = imread('ImgPIA(1).jpg');
figure;
imshow(Image);
Image = rgb2gray(Image);
title('ImgPIA image')

%transform of ImgPIA image
A = fft2(Image,256,256);
figure;
imshow(A)

% SEGMENTING  ImgPIA INTO four different SECTION 
I = Image;
image1=I(1:size(I,1)/2,1:size(I,2)/2,:);subplot(2,2,1);imshow(image1);
subplot(2,2,1);
title('figure1')
image2=I(size(I,1)/2+1:size(I,1),1:size(I,2)/2,:);subplot(2,2,2);imshow(image2);
subplot(2,2,2);
title('figure2')
image3=I(1:size(I,1)/2,size(I,2)/2+1:size(I,2),:);subplot(2,2,3);imshow(image3);
subplot(2,2,3);
title('figure3')
image4=I(size(I,1)/2+1:size(I,1),size(I,2)/2+1:size(I,2),:);subplot(2,2,4);imshow(image4);
subplot(2,2,4);
title('figure4')

%using fourier transform 
A = fft2(Image,256,256);
figure;
imshow(A);
A = fftshift(A); % using discrete fourier transform function for the four sections
figure;
imshow(A);

% Measuring minimum and maximum value of the transform amplitudes.
min(min(abs(A)))
max(max(abs(A)))
figure;
imshow(abs(A),[0 100]); colormap(jet); colorbar
figure;
imshow(log(1+abs(A)),[0,3]); colormap(jet); colorbar
% Looking the phases
figure;
imshow(angle(A),[-pi,pi]); colormap(jet); colorbar

%now using inverse of fourier transform
I = ifft2(A,256,256);
figure;
imshow(I);

% using the fourier with inverse function together
A = fft2(Image,256,256);
figure;
imshow(A);
A = fftshift(A); % using discrete fourier transform function for four sections
figure;
imshow(A);

% Measuring the min and max value of the transform amplitudes.
min(min(abs(A)))
max(max(abs(A)))
figure;
imshow(abs(A),[0 100]); colormap(jet); colorbar
figure;
imshow(log(1+abs(A)),[0,3]); colormap(jet); colorbar
% Looking for phases
figure;
imshow(angle(A),[-pi,pi]); colormap(jet); colorbar

A = fft2(Image,256,256);
figure;
imshow(A);

I = ifft2(A,256,256);
figure;
imshow(I);

% TASK 2 part 1:  select features for both radius and direction

%described as in the Spectral Approach session from the Feature Extraction
%lecture PPT.

figure;
imshow(Image);
figure;
%%offset values are 2,4,6,8
%  offset =2
offset_value = [0 2];
co_occurence_matrix = graycomatrix(Image, 'offset', offset_value,'NumLevels', 256, 'Symmetric',true);
subplot(2,2,1);imshow(co_occurence_matrix); 
title('Angle = 0 degree, offset value 2')

offset_value = [-2 2];
co_occurence_matrix = graycomatrix(Image, 'offset', offset_value,'NumLevels', 256, 'Symmetric',true);
subplot(2,2,2);imshow(co_occurence_matrix);
title('Angle = 45 degree, offset value 2')

offset_value = [-2 0];
co_occurence_matrix = graycomatrix(Image, 'offset', offset_value,'NumLevels', 256, 'Symmetric',true);
subplot(2,2,3);imshow(co_occurence_matrix);
title('Angle = 90 degree, offset value 2')

offset_value = [-2 -2];
co_occurence_matrix = graycomatrix(Image, 'offset', offset_value,'NumLevels', 256, 'Symmetric',true);
subplot(2,2,4);imshow(co_occurence_matrix);
title('Angle = 135 degree, offset value 2')


figure;
%  offset =4
offset_value = [0 4];
co_occurence_matrix = graycomatrix(Image, 'offset', offset_value,'NumLevels', 256, 'Symmetric',true);
subplot(2,2,1);imshow(co_occurence_matrix); 
title('Angle = 0 degree, offset value 4')

offset_value = [-4 4];
co_occurence_matrix = graycomatrix(Image, 'offset', offset_value,'NumLevels', 256, 'Symmetric',true);
subplot(2,2,2);imshow(co_occurence_matrix);
title('Angle = 45 degree, offset value 4')

offset_value = [-4 0];
co_occurence_matrix = graycomatrix(Image, 'offset', offset_value,'NumLevels', 256, 'Symmetric',true);
subplot(2,2,3);imshow(co_occurence_matrix);
title('Angle = 90 degree, offset value 4')

offset_value = [-4 -4];
co_occurence_matrix = graycomatrix(Image, 'offset', offset_value,'NumLevels', 256, 'Symmetric',true);
subplot(2,2,4);imshow(co_occurence_matrix);
title('Angle = 135 degree, offset value 4')

figure;
%  offset =6
offset_value = [0 6];
co_occurence_matrix = graycomatrix(Image, 'offset', offset_value,'NumLevels', 256, 'Symmetric',true);
subplot(2,2,1);imshow(co_occurence_matrix); 
title('Angle = 0 degree, offset value 6')

offset_value = [-6 6];
co_occurence_matrix = graycomatrix(Image, 'offset', offset_value,'NumLevels', 256, 'Symmetric',true);
subplot(2,2,2);imshow(co_occurence_matrix);
title('Angle = 45 degree, offset value 6')

offset_value = [-6 0];
co_occurence_matrix = graycomatrix(Image, 'offset', offset_value,'NumLevels', 256, 'Symmetric',true);
subplot(2,2,3);imshow(co_occurence_matrix);
title('Angle = 90 degree, offset value 6')

offset_value = [-6 -6];
co_occurence_matrix = graycomatrix(Image, 'offset', offset_value,'NumLevels', 256, 'Symmetric',true);
subplot(2,2,4);imshow(co_occurence_matrix);
title('Angle = 135 degree, offset value 6')


figure;
%  offset =8
offset_value = [0 8];
co_occurence_matrix = graycomatrix(Image, 'offset', offset_value,'NumLevels', 256, 'Symmetric',true);
subplot(2,2,1);imshow(co_occurence_matrix); 
title('Angle = 0 degree, offset value 8')

offset_value = [-8 8];
co_occurence_matrix = graycomatrix(Image, 'offset', offset_value,'NumLevels', 256, 'Symmetric',true);
subplot(2,2,2);imshow(co_occurence_matrix);
title('Angle = 45 degree, offset value 8')

offset_value = [-8 0];
co_occurence_matrix = graycomatrix(Image, 'offset', offset_value,'NumLevels', 256, 'Symmetric',true);
subplot(2,2,3);imshow(co_occurence_matrix);
title('Angle = 90 degree, offset value 8')

offset_value = [-8 -8];
co_occurence_matrix = graycomatrix(Image, 'offset', offset_value,'NumLevels', 256, 'Symmetric',true);
subplot(2,2,4);imshow(co_occurence_matrix);
title('Angle = 135 degree, offset value 8')


% plot the values = ["Degrees";"Offset_1";"Offset_2";"Offset_3";"Offset_4"];

Degrees = [0;45;90;135];
Offset_2 = [0 2; -2 2; -2 0; -2 -2];
Offset_4 = [0 4; -4 4; -4 0; -4 -4];
Offset_6 = [0 6; -6 6; -6 0; -6 -6];
Offset_8 = [0 8; -8 8; -8 0; -8 -8];
%T = table("Degrees";"Offset_2";"Offset_4";"Offset_6";"Offset_8")
Tabular = table(Degrees,Offset_2,Offset_4,Offset_6, Offset_8)