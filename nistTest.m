
clear;
m=0;
n=9;
a=1;
b=200;
mf=prnist([m:n],[a:b]);
mftst=prnist([m:n],[b+1:b+5]);
TrnData=my_repo(mf);
TstData=my_repo(mftst);

%label=[1:9,0];
%tst=prdataset();
% t1=clock;
% u=scalem([],'variance')*pcam([],0.9)*w
% t2=clock;
% RnnTime=etime(t2,t1);%0.3165
%PCA = pca(Trndata,0.99);
%w=knnc(Trndata*PCA,3);
% w=knnc(TrnData,2);
%w=knnc(TrnData,2);
%u=scalem([],'variance')*pcam([],0.9)*parzenc;%with pca error 19.7%
 u3=knnc([],2);%without pca error 15.9%
 u1=parzenc();
% %u=loglc();
 u2=fisherc();
% u=treec([],'infcrit',0);
 w1=TrnData*u1*classc;
 w2=TrnData*u2*classc;
 w3=TrnData*u3*classc;
 w=[w1 w2 w3];
% cmax=w*maxc;
% cmin=w*minc;
% cmean=w*meanc;
cvote=w*votec;
% u=nmc();
% u=treec([],'infcrit',0);
% u=svc(proxm('r',2));
%  t1=clock;
%  w=TrnData*u;
%  t2=clock;
%  timew=etime(t2,t1);
%  lab=TstData*w*labeld;
%wTrained=Trndata*w;
%Tstlabel=labeld(TstData*PCATs*w);
% c=TstData*w*classc;
% Test it
 t3=clock;
 error = nist_eval('my_repo',cvote,50)%parzen sift ori 0.345 without ori 0.1590
 t4=clock;
 timeError=etime(t4,t3);
 

