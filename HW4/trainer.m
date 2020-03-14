function [U,S,V,thresh1,thresh2,w,I] = trainer(specs1,specs2,specs3,nfeatures)
N1 = size(specs1,2);
N2 = size(specs2,2);
N3 = size(specs3,2);

[U,S,V] = svd([specs1 specs2 specs3],'econ');

songs = S*V';
U = U(:,1:nfeatures);
rspecs1 = songs(1:nfeatures,1:N1);
rspecs2 = songs(1:nfeatures,N1+1:N1+N2);
rspecs3 = songs(1:nfeatures,N1+N2+1:N1+N2+N3);

m1 = mean(rspecs1,2);
m2 = mean(rspecs2,2);
m3 = mean(rspecs3,2);
m = mean([rspecs1 rspecs2 rspecs3],2);

Sw = 0;
for k=1:N1
    Sw = Sw + (rspecs1(:,k)-m1)*(rspecs1(:,k)-m1)';
end
for k=1:N2
    Sw = Sw + (rspecs2(:,k)-m2)*(rspecs2(:,k)-m2)';
end
for k=1:N3
    Sw = Sw + (rspecs3(:,k)-m1)*(rspecs3(:,k)-m3)';
end

% Make scatter matrices
Sb = (m1-m)*(m1-m)';
Sb = Sb + (m2-m)*(m2-m)';
Sb = Sb + (m3-m)*(m3-m)';

% Solve generalized eigenvalue problem
[v,D] = eig(Sb,Sw);

% Get the largest eigenvector
[~,ind] = max(abs(diag(D)));
w = v(:,ind);
w = w/norm(w,2);

% Project on to the eigenvetor
vspecs1 = w'*rspecs1;
vspecs2 = w'*rspecs2;
vspecs3 = w'*rspecs3;

% Compute threshold
vspecs = [vspecs1;vspecs2;vspecs3];
means = [mean(vspecs1) mean(vspecs2) mean(vspecs3)];
[~,I] = maxk(means,3);
right = sort(vspecs(I(1),:));
mid = sort(vspecs(I(2),:));
left = sort(vspecs(I(3),:));

tl1 = length(left);
tl2 = 1;
while left(tl1) > mid(tl2)
    tl1 = tl1-1;
    tl2 = tl2+1;
end
thresh1 = (left(tl1)+mid(tl2))/2;

tr1 = length(mid);
tr2 = 1;
while mid(tr1) > right(tr2)
    tr1 = tr1-1;
    tr2 = tr2+1;
end
thresh2 = (mid(tr1)+right(tr2))/2;
end

