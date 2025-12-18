function [AA,AAA,num_edge_add]=spectral_crossover(A)
% spectral crossover
% mixes over a population in A

[n,~,nn]=size(A);




for i=1:nn


[css,cs1,cs2,c_edge]=spectr_clust_matrix1(A(:,:,i));
c(i)=css;
ec(i)=c_edge;
h1(i)={cs1};
h2(i)={cs2};
end


% number of nodes in cut

nnc=unique(c);

%unique(ec);


ii=1;
for i=1:length(nnc)

d1=h1(find(c==nnc(i)));


d2=h2(find(c==nnc(i))); 


% # edges cut

ecc=ec(find(c==nnc(i)));


r1=randi(size(find(c==nnc(i)),2),1,size(find(c==nnc(i)),2));
r2=randi(size(find(c==nnc(i)),2),1,size(find(c==nnc(i)),2));





for j=1:size(find(c==nnc(i)),2)

AA(:,:,ii)=blkdiag(d1{r1(j)},d2{r2(j)});

% add connections between the two clusters 

% number of edges
num_edge_add(ii)=max([ecc(r1(j)),ecc(r2(j))]);

%[nnc(i),n-nnc(i)]

% number of edges added
nn = num_edge_add(ii);


aa = zeros(nnc(i),n-nnc(i) );
aa(randperm(numel(aa), min(numel(aa),nn))) = 1;

AAA(:,:,ii)=blkdiag(d1{r1(j)},d2{r2(j)});
AAA(nnc(i)+1:n,1:nnc(i),ii)=aa';
AAA(1:nnc(i),nnc(i)+1:n,ii)=aa;


ii=ii+1;

end



end

