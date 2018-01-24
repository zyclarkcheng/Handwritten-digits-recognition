mf= prnist([0:9],[1:1000]);
mf1=prnist([0:9],[501:550]);

prwaitbar off
im = data2im(mf);
im1 = data2im(mf1);

imLabel=getlabels(mf);
imLabel1=getlabels(mf1);

len=length(im);
len1=length(im1);

imnew=zeros(len,1024);
imnew1=zeros(len1,1024);

for i=1:len
    imNoNoise = cDeNoise(im{i});
    imslant=slant(imNoNoise);
    
    imtrain=im_resize(imslant,[1,1024]);
    imnew(i,:)=imtrain;
end
for i=1:len1
    imNoNoise1 = cDeNoise(im1{i});
    imslant1=slant(imNoNoise1);
    
    imtest=im_resize(imslant1,[1,1024]);
    imnew1(i,:)=imtest;
end

trnset= prdataset(imnew,imLabel);
tstset= prdataset(imnew1,imLabel1);
prototype = gendat(trnset,0.001);
disspace = proxm(prototype,'d',1);
trainrep = trnset*disspace;

classf=trainrep*knnc([],2)
e = tstset*disspace*classf*testc

scatterd(trnset,2)