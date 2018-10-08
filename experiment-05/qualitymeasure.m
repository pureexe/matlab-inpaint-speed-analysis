clc; clear;
original_path = "resource/original.mp4";
fileList = [
    "splitbergman/splitbergman.mp4",...
    "splitbergman/multires-100110.mp4",...
    "splitbergman/multires-100310.mp4",...
    "splitbergman/multires-101010.mp4",...
    "borrowframe/borrowframe.mp4",...
    "borrowframe/borrowframe-multires-100110.mp4",...
    "borrowframe/borrowframe-multires-100310.mp4",...
    "borrowframe/borrowframe-multires-100110.mp4",...
    "opencv/opencv.mp4"
];
frameCount = 1442;
left = 280;
right = 1000;
top = 620;
bottom = 690;

for fileName = fileList
    original_video = VideoReader(original_path);
    current_video  = VideoReader(fileName);
    sum_rmse = 0;
    sum_psnr = 0;
    sum_ssim = 0;
    rmseData = zeros(frameCount,1);
    psnrData = zeros(frameCount,1);
    ssimData = zeros(frameCount,1);
    count = 1;
    while hasFrame(current_video) && hasFrame(original_video)
        current_frame = readFrame(current_video);
        ref_frame = readFrame(original_video);
        current_part = current_frame(top:bottom,left:right,:);
        ref_part = ref_frame(top:bottom,left:right,:);
        %imshowpair(ref_part,current_part, 'diff');
        rmseData(count) = sqrt(mean((current_part(:) - ref_part(:)).^2));
        psnrData(count) = psnr(current_part,ref_part);     
        ssimData(count) = ssim(current_part,ref_part);          
        count = count + 1;
    end
    disp(fileName);
    disp("RMSE");
    disp(mean(rmseData));
    disp("PSNR")
    disp(mean(psnrData));
    disp("SSIM");
    disp(mean(ssimData));
end