function [dens]=cSelected(matrix)
[m,n]=size(matrix);

%%%%%%%%%%%%%%%%%density feature%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
h=7;w=7;
divrow=fix(m/h); divcol=fix(n/w); dens=zeros(h+w,1);
for i=1:h %sum of every divison row
        dens(i)=dens(i)+sum(sum(matrix((i-1)*divrow+1:i*divrow,:),2),1);
end
for j=1:w
        dens(h+j)=dens(h+j)+sum(sum(matrix(:,(j-1)*divcol+1:j*divcol),1),2);
end
dens=dens'./49;
%%%%%%%%%%%%%%%%%%%%%%%Contour Feature%%%%%%%%%%%%%%%%%%%%%%%%%%%%


end% end of function
% for i=1:h
%     for j=1:w*divrow
%         dens(i)=dens(i)+matrix(divline*i-1,j);
%     end
% end
% for j=1:w
%     for i=1:h*divline
%         dens(h+j)=dens(j+h)+matrix(i,divrow*j-1);
%     end
% end
