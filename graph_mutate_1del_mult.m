  function[ggg,flag]=graph_mutate_1del_mult(g0,rep)
  % mutation by edge substitution
  % multiple edge removals
  

  d1=size(g0,1);

  %rep=4;
g1=g0;

for i=1:rep

  gg1=g1;
  
  
  w=randi(d1,2,1);
  flag(i)=0;
  
  

  if  w(1)~=w(2) & g1(w(1),w(2))==1
          
     
      
  gg1(w(1),w(2))=0;
  gg1(w(2),w(1))=0;    
      
flag(i)=1;  
  end
  

  
  
  % check if the graph is still connected
  % and undo mutation if so
  

  l=calc_laplacian(gg1,1);
  
  if l(2)<1e-10
      flag(i)=0;
      gg1=g1;
  end
 
GG(:,:,i)=gg1;

g1=gg1;
gg1=[];


end

 ggg=GG(:,:,rep);