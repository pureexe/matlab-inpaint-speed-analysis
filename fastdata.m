clc;clear;close all;
text = fileread('fastdata.txt');
datasets = strsplit(text,'-------------------');
result = [];
dataCount = size(datasets);
dataCount = dataCount(2);
for i = 2:dataCount-1
    lines = strsplit(string(datasets(i)),'\n');
    name = strip(lines(2));
    loop = strip(extractAfter(lines(3),6));
    time = strip(extractAfter(lines(4),13));
    PSNRS = strsplit(lines(8),' ');
    PSNR = extractAfter(PSNRS(8),8);
    SSIMS = strsplit(lines(7),' ');
    SSIM = extractAfter(SSIMS(11),4);
    current_data = [name loop time PSNR SSIM];
    result = [result;current_data];
end
% xlswrite('result.xls',result);
