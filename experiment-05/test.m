clc;clear;
original_path = 'C:\Users\pakkapon\Documents\Github\matlab-inpaint-speed-analysis\experiment-05\resource\original\';
current_path = 'C:\Users\pakkapon\Documents\Github\matlab-inpaint-speed-analysis\experiment-05\resource\thai\';
for i = 1:1440
    original_image = imread(sprintf('%s\\%04d.png',original_path,i));
    current_image = imread(sprintf('%s\\%04d.png',current_path,i));
    imshowpair(original_image,current_image,'diff');
end