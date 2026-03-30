function[GG]=generate_n_regulargraphs(numb,n,deg)
% generates numb regular graphs of size n
% and degree deg









count=1;


while count<numb+1

A=createRandRegGraph(n,deg);

if sum(A)>0
GG(:,:,count)=full(A);
count=count+1;
end

end





