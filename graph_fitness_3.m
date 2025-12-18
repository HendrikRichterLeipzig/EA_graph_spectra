function[fit,x,L,f1]=graph_fitness_3(G,target)

% fitness function


[~,~,n3]=size(G);


% start density
d1=repmat(target,n3,1);



[f1,x,L]=graphs2dens_1(G);

fit=sum(((f1-d1).^2)')/length(x);