original_video = VideoReader('resource/original.mp4');
current_video  = VideoReader('resource/thai.mp4');
count = 1;
while hasFrame(current_video) && hasFrame(original_video)
    current_part = readFrame(current_video);
    ref_part = readFrame(original_video);
    imshowpair(ref_part,current_part, 'diff');
    disp(count);
    count = count+1;
end