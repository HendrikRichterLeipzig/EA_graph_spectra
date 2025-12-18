function [AA,AAA,no_cut,flag]=spectral_crossover0(A)
% spectral crossover

[n,~,nn]=size(A);




for i=1:nn


[css,cs1,cs2,c_edge]=spectr_clust_matrix1(A(:,:,i));

AA(:,:,i)=blkdiag(cs1,cs2);
AAA(:,:,i)=blkdiag(cs1,cs2);
no_cut(i)=c_edge;


% number of edges added
nn = c_edge;

aa = zeros(css,n-css );
aa(randperm(numel(aa), min(numel(aa),nn))) = 1;


AAA(css+1:n,1:css,i)=aa';
AAA(1:css,css+1:n,i)=aa;


  % check if the graph is still connected
  % and undo mutation if so
  

  l=calc_laplacian(AAA(:,:,i),1);
  L=sort(l);
  if L(2)<1e-15
      flag(i)=1;
      AAA(:,:,i)=A(:,:,i);
  else
      flag(i)=0;
  end

end
