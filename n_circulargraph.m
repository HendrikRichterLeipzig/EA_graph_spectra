function[A]=n_circulargraph(n,p)
% adjacency matrix A of a prism graph with n vertices




% Number of nodes
%n = 12; % 6-regular graph with 12 nodes

% Create edges for the 6-regular graph
edges = [];
for i = 1:n
    for j = 1:n/p
        % Connect to 4 neighbors on each side
        edges = [edges; i, mod(i+j-1, n) + 1]; % Right neighbors
        edges = [edges; i, mod(i-j-1, n) + 1]; % Left neighbors
    end
end


% Create the graph
G = graph(edges(:,1), edges(:,2));

% Get the adjacency matrix
A = adjacency(G);

A=full(A);