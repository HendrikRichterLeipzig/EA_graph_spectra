function [spop,sfit,ind]=select_graph_n(pop,fit,nn)
% selection using 
% tournament selection tournament size n

%

% tournament size
%nn=4;

[~,~,ell]=size(pop);

rand('state',sum(100*clock));

rr=ceil(ell*(rand(nn,ell)));

spop=zeros(size(pop));
sfit=zeros(size(fit));

for i=1:ell

j1=rr(:,i);

f1=fit(j1);

g=find(f1==min(f1));



indxx=g(randi(length(g),1,1));
indx=j1(indxx,1);





spop(:,:,i)=pop(:,:,indx);
sfit(i)=fit(indx);
ind(i)=indx;



end