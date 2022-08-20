close all
clc

a = imread('ImgPIA(1).jpg');
figure;
b=imhist(a);
imshow(a);
a = rgb2gray(a);
title('our ImgPIA image')

gray_level_co_occu_matrix_0_s = graycomatrix(a, 'offset', [0 1],'NumLevels', 256, 'Symmetric', true);
statistic_0_s = graycoprops(gray_level_co_occu_matrix_0_s,{'contrast','correlation','energy','homogeneity'});
Angsecondmoment0deg = Angularsecondmomentum(gray_level_co_occu_matrix_0_s);
invdiffmoment0deg = inversedifferencemoment(gray_level_co_occu_matrix_0_s);
figure;
subplot(2,2,1);
imshow(gray_level_co_occu_matrix_0_s);
title('deg= 0 , gray_level_co_occu_matrix_ 0 _ s _ offset[0 1]')

gray_level_co_occu_matrix_45_s = graycomatrix(a, 'offset', [-1 1],'NumLevels', 256, 'Symmetric', true);
statistic_45_s = graycoprops(gray_level_co_occu_matrix_45_s,{'contrast','correlation','energy','homogeneity'});
Angsecondmoment45deg = Angularsecondmomentum(gray_level_co_occu_matrix_45_s);
invdiffmoment45deg = inversedifferencemoment(gray_level_co_occu_matrix_45_s);
figure;
subplot(2,2,2);
imshow(gray_level_co_occu_matrix_45_s);
title('deg= 45 , gray_level_co_occu_matrix_ 0 _ s _ offset[-1 1]')

gray_level_co_occu_matrix_90_s = graycomatrix(a, 'offset', [-1 0],'NumLevels', 256, 'Symmetric', true);
statistic_90_s = graycoprops(gray_level_co_occu_matrix_90_s,{'contrast','correlation','energy','homogeneity'});
Angsecondmoment90deg = Angularsecondmomentum(gray_level_co_occu_matrix_90_s);
invdiffmoment90deg = inversedifferencemoment(gray_level_co_occu_matrix_90_s);
figure;
subplot(2,2,3);
imshow(gray_level_co_occu_matrix_90_s);
title('deg= 90 , gray_level_co_occu_matrix_ 0 _ s _ offset[-1 0]')

gray_level_co_occu_matrix_135_s = graycomatrix(a, 'offset', [-1 -1],'NumLevels', 256, 'Symmetric', true);
statistic_135_s = graycoprops(gray_level_co_occu_matrix_135_s,{'contrast','correlation','energy','homogeneity'});
Angsecondmoment135deg = Angularsecondmomentum(gray_level_co_occu_matrix_135_s);
invdiffmoment135deg = inversedifferencemoment(gray_level_co_occu_matrix_135_s);
figure;
subplot(2,2,3);
imshow(gray_level_co_occu_matrix_135_s);
title('deg= 135 , gray_level_co_occu_matrix_ 0 _ s _ offset[-1 -1]')