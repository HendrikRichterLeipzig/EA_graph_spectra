function[ggg,flag,w]=graph_mutate_1add_biased_mult(g0,rep)
  % mutation by edge adding
  % biased to add at the node with highest degree
  % multiple edge adding 
  
  d1=size(g0,1);

  %rep=4;
g1=g0;

for i=1:rep

  gg1=g1;
  
    % select the node to get another edge with node degree bias
  v=sum(g1);

  probabilities = v/sum(v);
    
    % Generate a random number and find the corresponding index
    cumulativeProbabilities = cumsum(probabilities);
    
    randomValue = rand();
   
    
   w(1)=find(cumulativeProbabilities >= randomValue, 1);


  w(2)=randi(d1,1,1);
  flag(i)=0;
  
  

  if  w(1)~=w(2) & g1(w(1),w(2))==0
          
     
      
  gg1(w(1),w(2))=1;
  gg1(w(2),w(1))=1;    
      
flag(i)=1;  
  end
  
GG(:,:,i)=gg1;

g1=gg1;
gg1=[];


end
  ggg=GG(:,:,rep);


  % check if the graph is still connected
  
  
 