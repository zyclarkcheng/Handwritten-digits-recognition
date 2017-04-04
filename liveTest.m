clear;
Files = dir(strcat('digit/','*.jpg'));
LengthFiles = length(Files);
imLabel=[];
for i = 1:LengthFiles;%0.jpg---99.jpg
    fileNUM=strcat(num2str(i-1),'.jpg');
    im = imread(strcat('digit/',fileNUM));
    imbw=im2bw(im);
    imbw=~imbw;
    imbw=im_resize(imbw,[32,32]);
    imNoNoise=cDeNoise(imbw);  % reduce noise
    imslant=slant(imNoNoise);   % correct slant
    ims=im_resize(imbw,[32,32]);
   
    %imSled=[imSled1,imSled2];
    %imslant=im_resize(imslant,[32,32]);
    %imslant=im_box(imslant,[],1);
    imSled=extractHOGFeatures(ims,'CellSize',[8 8]);
    imVect(i,:)=imSled(1,:);
    %imLabel=[imLabel;genlab(1,strcat('digit_',num2str(mod(i-1,10))))];
    imLabel=[imLabel;strcat('digit_',num2str(mod(i-1,10)))];


end
imVect=double(imVect);
tst=prdataset(imVect,imLabel);
% trn=data(1:80,:);
% tst=data(81:100,:);
m=0;
n=9;
a=1;
b=10;
mf=prnist([m:n],[a:b]);
%mftst=prnist([m:n],[b+1:b+10]);
TrnData=my_repo(mf);
%TstData=my_repo(mftst);
%u=parzenc();
u3=knnc([],2);%without pca error 15.9%
u1=parzenc();
u2=fisherc();
w1=TrnData*u1*classc;
w2=TrnData*u2*classc;
w3=TrnData*u3*classc;
w=[w1 w2 w3];
cvote=w*votec;
E    = tst*cvote*testc()
%e=TestData*w*testc;

