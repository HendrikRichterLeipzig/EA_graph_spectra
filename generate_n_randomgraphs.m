function[GG]=generate_n_randomgraphs(numb,n,flag)
% generates numb random graphs of size n
% flag 1: ER
% flag 2: WS
% flag 3: BA









countws=1;
counter=1;
countba=1;

if flag==2

while countws<numb+1

[~,G]=WattsStrogatz(n,4,0.3); 

if sum(G)>0
Gws(:,:,countws)=G;
countws=countws+1;
end

end

GG=Gws;

elseif flag==1


while counter<numb+1

  G=erdosRenyi(n,0.3);
if sum(G)>0
Ger(:,:,counter)=G;
counter=counter+1;
end

end

GG=Ger;


elseif flag==3

while countba<numb+1
G=barabasi(n,8,5); 

if sum(G)>0
Gba(:,:,countba)=G;
countba=countba+1;
end
end


GG=Gba;

end