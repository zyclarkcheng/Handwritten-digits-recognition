function outIm=cDeNoise(Im)
w=[0 1 0;1 -8 0;0 1 0];%laplacian operator with -8 in center(should be -4)
outIm=imfilter(Im,w,'symmetric');
outIm=Im-outIm;
%outIm=medfilt2(Im,'symmetric');
% subplot(1,2,1);
% imshow(Im);
% subplot(1,2,2);
% imshow(outIm);
end