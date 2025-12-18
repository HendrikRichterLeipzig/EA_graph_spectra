function[FIT]=graph_ea_72(init,mut_rate,tar,popsize,cross)
% ea for evolving graphs



%  initial graph population




n=72;

if init==1

A1=some_72_16_graphs;

elseif init==2

A1=some_72_12_graphs;

elseif init==3


A1=some_72_9_graphs;

elseif init==4

A1=some_72_6_graphs;

elseif init==5

A1=some_72_3_graphs;



elseif init==6


% random graphs as initial population
% rg 1 ER, rg 2 WS rg 3 BA


rg=1;


A1=generate_n_randomgraphs(popsize,n,rg);



elseif init==7



% random graphs as initial population
% rg 1 ER, rg 2 WS rg 3 BA


rg=2;


A1=generate_n_randomgraphs(popsize,n,rg);

elseif init==8



% random graphs as initial population
% rg 1 ER, rg 2 WS rg 3 BA


rg=3;


A1=generate_n_randomgraphs(popsize,n,rg);


end









G=A1(:,:,1:min(popsize,size(A1,3)));

% population size
[~,~,popsize]=size(G)

% generations

gener=150;



% density target


if tar==1

Atar=stargraph(n);



elseif tar==2

Atar=n_circulargraph(n,3);

elseif tar==3

Atar=n_circulargraph(n,4);

end

target=graphs2dens_1(Atar);

   Ftar=calc_laplacian(Atar,2);


tar_lamb=Ftar(2,:);




for i=1:gener
 
   % fitness 
   
   [fit,x,L,ff]=graph_fitness_3(G,target);
   


% recording fitness
   FIT(i,1)=mean(fit);
   FIT(i,2)=min(fit);
   FIT(i,3)=max(fit);

   % all fitness
FFF(i,:)=fit;   

% finding the  best
bb=find(fit==min(fit));




BestGraph(:,:,i)=G(:,:,bb(1));









   % selection
   

   toursize=2;
   
   
   [sG,~,sindx]=select_graph_n(G,fit,toursize);
   F1=L(1,sindx);
   % crossover
   
if rem(i,1)==0

 
if cross==1

 [~,cG,no_cut,~]=plain_crossover1(sG);
  
elseif cross==2
 [~,cG,no_cut,~]=spectral_crossover0(sG);
  
elseif cross==3
 [~,cG,no_cut]=spectral_crossover(sG);
end

else
    cG=sG;
end

   








thres_lamb=0.001;

   for ii=1:size(sG,3) 
% degree


  if (F1(1,ii)<tar_lamb) & (rand()<mut_rate)

[Aa,flag]=graph_mutate_1add_biased_mult(cG(:,:,ii),2);
adr_add1(ii)=sum(flag);

  elseif min(sum(sG(:,:,ii)))<2 & (rand()<mut_rate) & (F1(1,ii)<thres_lamb) 
      [Aa,flag]=graph_mutate_1add_biased_low_mult(cG(:,:,ii),2);
adr_add2(ii)=sum(flag);

  elseif (rand()<mut_rate)
[Aa,flag]=graph_mutate_1del_mult(cG(:,:,ii),4);
  adr_del(ii)=sum(flag);

  else
      Aa=cG(:,:,ii);
  
  end

mG(:,:,ii)=Aa;
   
   end


   G=mG;
   mG=[];
   sG=[];
    
    
   % elistism

eli=randi(popsize,1);
  
eli1=find(FIT(:,2)==min(FIT(:,2)));

% occational elitism
if rem(i,1)==0
G(:,:,eli)=BestGraph(:,:,eli1(1));
end


end



