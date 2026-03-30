MATLAB files to evolve graphs towards desired Laplacian spectra

Main files

graph_ea_24 --> evolves graphs of size 24
graph_ea_48 --> evolves graphs of size 48
graph_ea_72 --> evolves graphs of size 72
graph_ea_XX --> evolves graphs of size XX, the paper considers XX=64, 128, 256, 512


inputs: 
1 init:  values 1-8 --> selects which initial graph population is used. 1-5: regular input graphs with size XX and degree YY=16,12,9,6,3 --> input files: some_XX_YY_graphs.m. 6-8 random graphs --> input file: generate_n_randomgraphs.m
2 mut_rate --> used in paper: 0.75
3 tar: target graph --> selecs target graph. 1-3. 1 --> stargraph, 2-3 --> circulant graphs
4 popsize --> used in paper: 40
5 cross --> crossover. 1 --> plain_crossover1.m, 2 --> spectral_crossover0.m, 3 --> spectra_crossover.m
6 n --> dimension of the evolved graphs
