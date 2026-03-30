function[FIT,BestGraph]=graph_ea_XX(init,mut_rate,Atar,popsize,n)
% ea for evolving graphs



%  initial graph population

% regular graphs
%A1=all_cubic_12_graphs;
%A1=all_quartic_12_graphs;
%A1=all_octic_12_graphs;
%A1=all_nonic_12_graphs;
%A1=all_octic_12_graphs;
%A1=all_cubic_cut_1_20_2;
%A1=all_cubic_cut_1_22_A2;




if init==1

A1=generate_n_regulargraphs(popsize,n,16);

%A1=some_48_16_graphs;

elseif init==2

A1=generate_n_regulargraphs(popsize,n,12);

%A1=some_48_12_graphs;

elseif init==3


    A1=generate_n_regulargraphs(popsize,n,9);
%A1=some_48_9_graphs;

elseif init==4

A1=generate_n_regulargraphs(popsize,n,6);

%A1=some_48_6_graphs;

elseif init==5

A1=generate_n_regulargraphs(popsize,n,3);

%A1=some_48_3_graphs;



elseif init==6

%popsize=40;
% random graphs as initial population
% rg 1 ER, rg 2 WS rg 3 BA


rg=1;


A1=generate_n_randomgraphs(popsize,n,rg);



elseif init==7


%popsize=40;
% random graphs as initial population
% rg 1 ER, rg 2 WS rg 3 BA


rg=2;


A1=generate_n_randomgraphs(popsize,n,rg);

elseif init==8


%popsize=40;
% random graphs as initial population
% rg 1 ER, rg 2 WS rg 3 BA


rg=3;


A1=generate_n_randomgraphs(popsize,n,rg);


end

%A1=some_48_12_graphs;
%A1=some_48_22_graphs;



%A1=all_14_10_graphs;





% graph size
%n=24;
% random graphs as initial population
% rg 1 ER, rg 2 WS rg 3 BA

%popsize=40;
%rg=1;


%A1=generate_n_randomgraphs(popsize,n,rg);

G=A1(:,:,1:min(popsize,size(A1,3)));

% population size
[~,~,popsize]=size(G)

% generations

gener=1000;



% density target

%A2=all_octic_12_graphs;
%A2=all_cubic_12_graphs;
%A2=all_cubic_cut_1_20_2;
%A2=A1;
%A2=some_48_12_graphs;
%if tar==1
%Atar=petalgraph(n);

%elseif tar==3
%Atar=stargraph(n);

%Atar=ringgraph(n);
%Atar=moebiusgraph(n);
%Atar=antiprismgraph(n);
%elseif tar==2
%Atar=sexticprismgraph(n);

%elseif tar==4
% complete graph
%Atar=ones(n,n)-eye(n);


%elseif tar==5

%Atar=n_circulargraph(n,3);

%elseif tar==6

%Atar=n_circulargraph(n,4);

%end
%Atar=A2(:,:,1);




target=graphs2dens_1(Atar);

   Ftar=calc_laplacian(Atar,2);


tar_lamb=Ftar(2,:);

%Ftar(n-1)

% target degree pathlength and clustering coefficient
%[ccc1,ap11] = clusteringcoef(Atar);
%tar_clus=mean(ccc1);
%tar_path=ap11;

% target degree

%ard_tar=median(sum(Atar));
%mrd_tar=max(sum(Atar));
%lrd_tar=min(sum(Atar));

% target centrality


%C_b_tar = mean(centrality(graph(Atar),'betweenness')); 
%C_c_tar = mean(centrality(graph(Atar),'closeness')); 


FIT=zeros(gener,3);
BestGraph=zeros(n,n,gener);

for i=1:gener
 
   % fitness 
   
   [fit,x,L,ff]=graph_fitness_3(G,target);
   


% recording fitness
   FIT(i,1)=mean(fit);
   FIT(i,2)=min(fit);
   FIT(i,3)=max(fit);

   % all fitness
%FFF(i,:)=fit;   

% finding the  best
bb=find(fit==min(fit));

% finding the xx % best
% percentage 40%


per=0.6;

bb_xx=find(fit<(min(fit)+per*(max(fit)-min(fit))));
count_best(i)=size(bb_xx,2);
% recording spectral distance


FF(i,:)=ff(bb(1),:);


BestGraph(:,:,i)=G(:,:,bb(1));


% recording lambda_2

%meanlambda(i)=mean(L(1,:));
%bestlambda(i)=L(1,bb(1));
%lambda2_perc(i,1:size(bb_xx,2))=L(1,bb_xx);
%lambda2_all(i,:)=L(1,:);

% recoding graph evaluation metrics



% degree 

%ard(i)=median(sum(G(:,:,bb(1))));
%mrd(i)=max(sum(G(:,:,bb(1))));
%lrd(i)=min(sum(G(:,:,bb(1))));



%max_perc_degree(i,1:size(bb_xx,2))=max(squeeze(sum(G(:,:,bb_xx),2)));
%min_perc_degree(i,1:size(bb_xx,2))=min(squeeze(sum(G(:,:,bb_xx),2)));
%med_perc_degree(i,1:size(bb_xx,2))=median(squeeze(sum(G(:,:,bb_xx),2)));
%mea_perc_degree(i,1:size(bb_xx,2))=mean(squeeze(sum(G(:,:,bb_xx),2)));

%max_all_degree(i,:)=max(squeeze(sum(G(:,:,:),2)));
%min_all_degree(i,:)=min(squeeze(sum(G(:,:,:),2)));
%med_all_degree(i,:)=median(squeeze(sum(G(:,:,:),2)));
%mea_all_degree(i,:)=mean(squeeze(sum(G(:,:,:),2)));

% centrality

%C_b(i) = mean(centrality(graph(G(:,:,bb(1))),'betweenness')); 
%C_c(i) = mean(centrality(graph(G(:,:,bb(1))),'closeness')); 

% xx% best



% clustering & pathlength

% all graphs
%[ci,apl]=clus_path_length(G);
%ci_all(i,:)=ci;
%apl_all(i,:)=apl;

% perc graphs
%[ci,apl]=clus_path_length(G(:,:,bb_xx));
%ci_perc(i,1:size(bb_xx,2))=ci;
%apl_perc(i,1:size(bb_xx,2))=apl;




   % selection
   

   %toursize=2;
   
   
   [sG,~,sindx]=select_graph1(G,fit);
   F1=L(1,sindx);
   % crossover
   
if rem(i,2)==0

 

% [~,cG,no_cut,~]=plain_crossover1(sG);
   %[~,cG,no_cut,~]=spectral_crossover0(sG);
  [~,cG,no_cut]=spectral_crossover(sG);
else
    cG=sG;
end

   






  % tar_lamb=0.01;
   
   % mutation
   % add-del-ratio
   adr_del=0;
adr_add1=0;
adr_add2=0;

%mut_rate=0.6;

   for ii=1:size(sG,3) 
% degree


  if (F1(1,ii)<tar_lamb) & (rand()<mut_rate)

[Aa,flag]=graph_mutate_1add_biased_mult(cG(:,:,ii),2);
adr_add1(ii)=sum(flag);

  elseif min(sum(sG(:,:,ii)))<2 & (rand()<mut_rate)
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

mut_del(i)=sum(adr_del)/size(sG,3);
mut_add1(i)=sum(adr_add1)/size(sG,3);
mut_add2(i)=sum(adr_add2)/size(sG,3);
adr_del=0;
adr_add1=0;
adr_add2=0;

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






%figure
%plot([1:1:gener],FIT(:,1),'r-',[1:1:gener],FIT(:,2),'g-',[1:1:gener],FIT(:,3),'b-')
%xlabel('median (r), min (g)  and max fitness (b)')

%be_gr_ind=find(FIT(:,2)==min(FIT(:,2)));

%print_2_graphs(Atar(:,:,1),BestGraph(:,:,1))



%print_2_graphs(Atar(:,:,1),BestGraph(:,:,be_gr_ind(1)))
%be_gr_ind(1)

%[max(sum(squeeze(Atar(:,:,1)))),min(sum(squeeze(Atar(:,:,1))))]
%[max(sum(squeeze(BestGraph(:,:,1)))),min(sum(squeeze(BestGraph(:,:,1))))]
%[max(sum(squeeze(BestGraph(:,:,be_gr_ind(1))))),min(sum(squeeze(BestGraph(:,:,be_gr_ind(1)))))]


%print_2_graphs_spec_clust(Atar,BestGraph(:,:,1))
%print_2_graphs_spec_clust(Atar,BestGraph(:,:,be_gr_ind(1)))

%figure
%plot([1:1:gener],ci-tar_clus,'r-',[1:1:gener],apl-tar_path,'b-')
%xlabel('clusering (r)  and pathlenth (b)')


%[div_count_med]=diversity_contribution1(count_best,med_perc_degree);
%[div_count_mea]=diversity_contribution1(count_best,mea_perc_degree);
%figure
%plot([1:1:gener],bestlambda-tar_lamb,'r-',[1:1:gener],meanlambda-tar_lamb,'b-',[1:1:gener],mean_best_lambda-tar_lamb,'g-')
%xlabel('\lambda_2 best (r) , \lambda_2 all (b) \lambda_2 best (g)')

%figure
%plot([1:1:gener],count_best,'r-')

%xlabel('count best')

%figure
%plot([1:1:gener],div_count_med,'r-',[1:1:gener],div_count_mea,'b-')

%xlabel('diversity contribution perc: median degree (r), mean degree (b) ')


%[div_count_all_med]=diversity_contribution_all(med_all_degree);
%[div_count_all_mea]=diversity_contribution_all(mea_all_degree);

%figure
%plot([1:1:gener],div_count_all_med,'r-',[1:1:gener],div_count_all_mea,'b-')

%xlabel('diversity contribution all: median degree (r), mean degree (b) ')

%[div_count_all_lambda]=diversity_contribution_all(lambda2_all);

%[div_count_lambda]=diversity_contribution1(count_best,lambda2_perc);

%figure
%plot([1:1:gener],div_count_all_lambda,'r-',[1:1:gener],div_count_lambda,'b-')

%xlabel('diversity contribution lambda2: all (r), perc (b) ')

%[div_count_all_ci]=diversity_contribution_all(ci_all);

%[div_count_ci]=diversity_contribution1(count_best,ci_perc);

%figure
%plot([1:1:gener],div_count_all_ci,'r-',[1:1:gener],div_count_ci,'b-')

%xlabel('diversity contribution clustering coefficient: all (r), perc (b) ')


%[div_count_all_apl]=diversity_contribution_all(apl_all);

%[div_count_apl]=diversity_contribution1(count_best,apl_perc);

%figure
%plot([1:1:gener],div_count_all_apl,'r-',[1:1:gener],div_count_apl,'b-')

%xlabel('diversity contribution average path length: all (r), perc (b) ')




%figure
%plot([1:1:gener],mean_best_degree(3,:)-ard_tar,'r-',[1:1:gener],mean_best_degree(2,:)-lrd_tar,'b-',[1:1:gener],mean_best_degree(1,:)-mrd_tar,'g-')
%xlabel('best percentage degree median (r) , min (b), max (g)')


%figure
%plot([1:1:gener],div_count_degree(3,:),'r-',[1:1:gener],div_count_degree(2,:),'b-',[1:1:gener],div_count_degree(1,:),'g-')

%xlabel('diversity contribution degree median (r) , min (b), max (g)')

% diversity vs. fitness


%figure

%plot(FFF(1,:),max_all_degree(1,:),'r*',FFF(gener,:),max_all_degree(gener,:),'b*',FFF(ceil(gener/2),:),max_all_degree(ceil(gener/2),:),'g*',FFF(1,:),min_all_degree(1,:),'ro',FFF(gener,:),min_all_degree(gener,:),'bo',FFF(ceil(gener/2),:),min_all_degree(ceil(gener/2),:),'go')
%xlabel('fitness vs. degree:  start (r) , mid (g), end (b), max degree *, min degree o ')


%figure

%plot(FFF(1,:),med_all_degree(1,:),'r*',FFF(gener,:),med_all_degree(gener,:),'b*',FFF(ceil(gener/2),:),med_all_degree(ceil(gener/2),:),'g*')
%xlabel('fitness vs. degree:  start (r) , mid (g), end (b), median degree * ')


%figure

%plot(FFF(1,:),mea_all_degree(1,:),'r*',FFF(gener,:),mea_all_degree(gener,:),'b*',FFF(ceil(gener/2),:),mea_all_degree(ceil(gener/2),:),'g*')
%xlabel('fitness vs. degree:  start (r) , mid (g), end (b), mean degree * ')


%figure

%plot(FFF(1,:),ci_all(1,:),'r*',FFF(gener,:),ci_all(gener,:),'b*',FFF(ceil(gener/2),:),ci_all(ceil(gener/2),:),'g*')
%xlabel('fitness vs. clustering coeff:  start (r) , mid (g), end (b), median degree * ')



%figure

%plot(FFF(1,:),apl_all(1,:),'r*',FFF(gener,:),apl_all(gener,:),'b*',FFF(ceil(gener/2),:),apl_all(ceil(gener/2),:),'g*')
%xlabel('fitness vs. av path length:  start (r) , mid (g), end (b), median degree * ')


%figure
%plot([1:1:gener],ard-ard_tar,'r-',[1:1:gener],lrd-lrd_tar,'b-',[1:1:gener],mrd-mrd_tar,'g-')
%xlabel('degree median (r) , min (b), max (g)')

%figure
%plot([1:1:gener],C_c-C_c_tar,'r-',[1:1:gener],C_b-C_b_tar,'b-')
%xlabel('centrality  closeness (r) , betweenness (b)')



%figure
%plot([1:1:gener],mut_add1,'g-',[1:1:gener],mut_add2,'b-',[1:1:gener],mut_del,'r-')
%xlabel('add1 (g) add2 (b) del (r) -ratio')

%figure
%plot3(x,(gener+5)*ones(size(x)),target,'b-','LineWidth',1.5);

%hold on





%plot3(x,(gener+2)*ones(size(x)),FF(be_gr_ind(1), :),'c-','LineWidth',1.5);
%hold on

%hold on
%plot3(x,ones(size(x)),FF(1, :),'r-','LineWidth',1.5);
%hold on

%c=cool(gener);
 %   for ii = 2:gener
  %      plot3(x,(ii)*ones(size(x)),FF(ii, :), 'Color', c(ii,:),'LineWidth',0.1);
   %     hold on
   % end
