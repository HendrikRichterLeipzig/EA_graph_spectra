function [A00,A0,no_cut,flag]=plain_crossover1(A)
% plain crossover = cut-and-join 
% cut the graph randomly and join at random nodes 

[n,~,nn]=size(A);



count=1;
for i=1:nn/2

    r=randi(nn,[2,1]);

    [css,cs11,cs12,c_edge1]=random_cut_matrix(A(:,:,r(1)));
    [css,cs21,cs22,c_edge2]=random_cut_matrix1(A(:,:,r(2)),css);

no_cut1(count)=c_edge1;
no_cut2(count)=c_edge2;

A1(:,:,count)=blkdiag(cs11,cs22);
A2(:,:,count)=blkdiag(cs12,cs21);



AA(:,:,count)=blkdiag(cs11,cs22);
AAA(:,:,count)=blkdiag(cs12,cs21);


n0=c_edge1;

aa = zeros(css,n-css );
aa(randperm(numel(aa), min(numel(aa),n0))) = 1;


AA(css+1:n,1:css,count)=aa';
AA(1:css,css+1:n,count)=aa;



n0=c_edge2;

aa = zeros(css,n-css );
aa(randperm(numel(aa), min(numel(aa),nn))) = 1;


AAA(css+1:n,1:css,count)=aa';
AAA(1:css,css+1:n,count)=aa;



count=count+1;


end



A0=AA;


A0(:,:,count:nn)=AAA;


A00=A1;
A00(:,:,count:nn)=A2;


no_cut=[no_cut1,no_cut2];

for i=1:nn

  l=calc_laplacian(A0(:,:,i),1);
  L=sort(l);
  if L(2)<1e-15
      flag(i)=1;
A0(:,:,i)=A(:,:,i);
  else
      flag(i)=0;
  end
end

%for i=1:nn

 % l=calc_laplacian(A0(:,:,i),1);
  %L=sort(l);
  %if L(2)<1e-15
   %   flag1(i)=1;

  %else
   %   flag1(i)=0;
  %end
%end


