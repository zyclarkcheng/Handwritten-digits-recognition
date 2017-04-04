function [dataset]=my_repo(mf)%input prdatafile, return nx1024, n is object number per class
prwaitbar off;
im=data2im(mf);%cell
len=length(im);%len=(n-m+1)*(b-a+1)
imLabel=getlabels(mf);
%imVect=zeros(len,576);
for i=1:len
    imNoNoise=cDeNoise(im{i});  % reduce noise
    
    imslant=slant(imNoNoise);   % correct slant
    
    %imSled1=cSelected(imslant);
    
    %invm=invmoments(imslant);
    %imSled2=-sign(invmoments(imslant)).*(log10(abs(invmoments(imslant))));%transform make invm bigger !
    
    %imSled=[imSled1,imSled2];
    imslant=im_resize(imslant,[32,32]);
    %imslant=im_box(imslant,[],1);
    imSled=extractHOGFeatures(imslant,'CellSize',[8 8]);
    
    %[m,n]=size(imSled);       %1x324
   % fc1=[16;16;3;pi/2];
   % fc2=[16;16;0;0]; %no help for reducing error.
   % [f1,d1]= vl_sift(single(imslant)) ;
   %[f2,d2]= vl_sift(single(imslant),'frames',fc2) ;

%    [f,d]=vl_sift(single(imslant));
        %Objects X Dimension
    
    %  d=d2';
    %  imVect(i,:)=d(1,:);
    
     imVect(i,:)=imSled(1,:);

%     for j=1:m
%         for k=1:n
%             imVect(i,(j-1)*m+k)=imSled(j,k); 
%         end
%     end
end
imVect=double(imVect);
dataset=prdataset(imVect,imLabel);
end

