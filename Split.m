I=imread('write.jpg');
%mkdir('digit');
[m,n,p]=size(I);
m1=floor(m/10);
n1=floor(n/10);
%figure;
for j=0:9
    for i=1:10
    Inew=I(1+(i-1)*m1:m1*i,1+j*n1:n1*(j+1),:);
    imshow(Inew);
    imwrite(Inew, strcat(num2str((i-1)+j*10),'.jpg'), 'jpg');
    end
end