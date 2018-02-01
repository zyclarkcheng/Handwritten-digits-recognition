clear;
m=0;
n=9;
a=1;
b=1000;

mf=prnist([m:n],[a:b]);
% mftst=prnist([m:n],[b+1:b+5]);

TrnData=my_repo(mf);
% TstData=my_repo(mftst);

% PCA = pca(Trndata,0.99); 
% pca_coeff = TrnData * pcam(0.99)
% TrnData = TrnData*pca_coeff
% % % u=svc(proxm('p',1));

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
U2 = featself([],'NN',20); %10*1000
W = TrnData*U2;
V = TrnData*(W*ldc); 

error = nist_eval('my_repo',V,10);
disp(error)
