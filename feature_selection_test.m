clear;
m=0;
n=9;
a=1;
b=100;
% 
mf=prnist([m:n],[a:b]);
% % % % % mftst=prnist([m:n],[b+1:b+5]);
% % % % 
TrnData=my_repo(mf);

% TstData=my_repo(mftst);

% PCA = pca(Trndata,0.99); 
% pca_coeff = TrnData * pcam(0.99)
% TrnData = TrnData*pca_coeff


% W1 = A*featseli([],'NN',4);     W1 = setname(W1,'ISel NN'); 
% W2 = A*featseli([],'maha-s',4); W2 = setname(W2,'ISel maha-s');
% W3 = A*featseli([],'maha-m',4); W3 = setname(W3,'ISel maha-m');
% W4 = A*featseli([],'in-in',4);  W4 = setname(W4,'ISel in-in');
% W5 = A*featseli([],ldc,4,5);    W5 = setname(W5,'ISel wrapper');
% disp([+W1;+W2;+W3;+W4;+W5])     % show selected features
% V = T*({W1,W2,W3,W4,W5}*ldc);   % train all selectors and classifiers
% S*V*testc                       % show test result

% U1 = featseli([],'maha-s',4);
% U2 = featself([],'NN',20);  %0.06 10*100
% U2 = featself([],'NN',30);  %0.06 10*100
% U3 = featselb([],'NN',20);  %0.18 10*100
% U2 = featself([],ldc,20); %10*1000  0.0700
% U2 = featself([],'in-in',20); %10*1000 0.0500

% PCA = pca(TrnData,0.99);
% w=knnc(TrnData*PCA,3);
% w = w * TrnData
% W = TrnData*U2;
% c =parzenc();


%--------------1000---------------------
% 0.95
% ldc 0.0300 
% nmc 0.0700
% fisherc 0.0300
% bpxnc 0.26
% qdc 0.0400
% knnc([],3) 0？？？？
% loglc 0.0500
% parzenc
% u=svc(proxm('p',1)); %too large
% w = pcam(0.95)*parzenc();

% 0.6
% ldc 0.04
% nmc 0.1000
% fisherc 0.08
% bpxnc 0.06
% qdc 0.0400
% knnc([],3) 0.01
% loglc 0.04

% 0.85
% ldc 0.03
% nmc 0.07
% fisherc 0.03
% bpxnc 0.04
% qdc 0.03
% knnc([],3) 0
% loglc 0.04
% w = maxc(w)% 0.01
% w = minc(w)% 0.02
% w = meanc(w)% 0.02
% w = votec(w)%0.02

%--------------100---------------------
% 0.85
% ldc 0.03
% nmc 0.08
% fisherc 0.06
% bpxnc 1
% qdc 0.08
% knnc([],3) 0.04
% loglc 0.06
% parzenc 0.04
% svc(proxm('p',1)) 0.08


w1 = TrnData*pcam(0.85)*bpxnc;
% w2 = TrnData*pcam(0.85)*knnc([],3);
% w3 = TrnData*pcam(0.85)*parzenc;
c = TrnData*w1;
% V = TrnData*(W*c); 

% w=[w1 w2 w3];
% % 
% w = maxc(w)% 0.04
% w = minc(w)% 0.03
% w = meanc(w)% 0.04
% w = votec(w)%0.04
% w = TrnData*w;

error = nist_eval('my_repo',c,10);
disp(error)
