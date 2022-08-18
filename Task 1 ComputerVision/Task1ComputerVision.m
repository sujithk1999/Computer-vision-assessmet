close all
clc
%reading skin lesion dataset of org images and GroundTruth images
OrgImage_folder = dir('org data\*.jpg');
GroundTruthImage_folder=dir('GT\*.png');
for i=1:numel(OrgImage_folder)
    base_file = OrgImage_folder(i);
    folderfilename = fullfile(base_file.folder, base_file.name);
    Imagefile_segment = GroundTruthImage_folder(i);
    
    disp(folderfilename);
    filesegment=fullfile(Imagefile_segment.folder,Imagefile_segment.name);
    segmentingimages=imread(filesegment);
    Segmenting=logical(segmentingimages);
    I = imread(folderfilename);
    Grayscalingimage=rgb2gray(I)
    
    Binary_image= im2bw(Grayscalingimage)
    compliment_images=imcomplement(Binary_image)

    imshow(compliment_images)
    impixelinfo
    imwrite(compliment_images,base_file.name)
    k(i)=dice(compliment_images,Segmenting)
end

mean_value_of_skin_images=mean(k)
std_deviation_of_skin_images=std(k)
bar(k)
OrgImage_folder = OrgImage_folder(~[OrgImage_folder.isdir]);
OrgImage_folder = {OrgImage_folder.name}
dicescore1= categorical(OrgImage_folder);
dice_similarity1= categorical(k(i))
bar(dicescore1,k())
xlabel('Number_of_images')
ylabel('DICE-SCORES-of Each-Images')