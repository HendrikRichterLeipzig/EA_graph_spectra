function[res]=calc_laplacian(A,flag) 
% calculates the Laplacians
% flag = 1 --> standard Laplacian
% flag = 2 --> normalized Laplacian








[n,~,n3]=size(A);



if flag==1



for i=1:n3

   
    
 
    
        
               
    
    Lapl=diag(sum(A(:,:,i)))-A(:,:,i);
    
     %D=diag(1./sqrt(sum(A(:,:,i))));
      
 [v,P1]=eig(Lapl);
  P1=diag(P1);
    res(:,i)=P1;
    

end


elseif flag==2

    
    for i=1:n3

   
    
 
    
        
               
    
    Lapl=diag(sum(A(:,:,i)))-A(:,:,i);
    
    
    % finite test
    
    if prod(sum(A(:,:,i)))==0
    D=eye(n);
        
    else
    
     D=diag(1./sqrt(sum(A(:,:,i))));
    end

    
 [v,P1]=eig(D*Lapl*D);
  P1=diag(P1);

    res(:,i)=P1;
    

end
    
    

end







