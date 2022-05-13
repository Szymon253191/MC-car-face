clear;
clc;
close all;

RGB = imread('LFA.bmp');
L = superpixels(RGB,10000);
imshow(RGB)
h1 = drawpolygon('Position',[180,280; 300,200; 600,200; 700,250; 700,500; 180,500]);
figure(1)
roiPoints = h1.Position;
roi = poly2mask(roiPoints(:,1),roiPoints(:,2),size(L,1),size(L,2));

BW = grabcut(RGB,L,roi);
imshow(BW)
figure(2)
maskedImage = RGB;
maskedImage(repmat(~BW,[1 1 3])) = 255;
imshow(maskedImage)

tic

[W, H, O] = size(maskedImage);
punkty_czarne = 0;
ilosc_punktow = W * H;

x = 10000; % l. probek
w = randi(H,x,1);
h = randi(W,x,1);
hold on;

for i = 1:1:x
     if BW(h(i,1),w(i,1)) == 1
        punkty_czarne = punkty_czarne + 1; 
     end
end
toc
scatter(w(:),h(:),5,'filled')

statystyka = punkty_czarne/x * 100

%   Przyjmujac ze pixel to 0,2m2 wtedy 24% kadru o polu xm2 to pole = xm2 * 24%












