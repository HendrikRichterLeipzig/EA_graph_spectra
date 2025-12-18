function [G] = erdosRenyi(n,p)
% 
%   
%     
%    Output Arguments:
%        G : generated random graph
%        n : graph size, number of vertexes, |V|
%        m : graph size, number of edges, |E|
%    Input Arguments:
%        n : graph size, number of vertexes, |V|
%        p : the probability p of the second definition of Erdos-Renyi model.
%        seed: seed of the function. 
%        format:
%        opt:
% 

%rng(seed);
G = spones(triu(sprand(n,n,p),1));


    G = G + G';
G=full(G);

