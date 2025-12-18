function[f,x]=graphs2dens(G)
% calculates the spectral density for the graphs in G






F=calc_laplacian(G,2);


n=size(G,1);


  delta=0.001;
  x=[0:delta:2];
%  sigma_1=1/2/n;
 sigma_1=1/n;

  
ev=F(:);
f=zeros(size(x));
    for j=1:length(ev)
    
     
     f=(j-1)/j*f+1/j*(1/sqrt(2*pi*sigma_1^2)*exp(-((x-ev(j)).^2/2/sigma_1^2)));   
  
    
    end
    
   
    


f=f/trapz(f)*100;