function NetRep= Run_SimNet(Adjacency,dimension,c)

%If c is set to 1, a constant Alpha is used, other wise of c=0, Alpha is a dynamic damping factor



%Adjacency Matrix Is Loaded

P=ScaleMat(Adjacency); %matrix is scaled

N=length(Adjacency);

Adjacency=Adjacency/(N*max(max(Adjacency)));



W = Adjacency - diag(diag(Adjacency));  %diagonal elements must be 0

D = diag(sum(W), 0); %degree matrix

L_plus=pinv(D-Adjacency); %Moore-Penrose pseudoinverse





Alpha=zeros(N,N);

if (c)

Alpha = 0.5;





else

for i=1:N

    for j=1:N

        Alpha(i,j)=(atan(L_plus(i,j))+pi/2)/pi;

    end

end



S  = Simillarity(Alpha,Adjacency,c);



k=1; %constant,no need to use higher steps

CoMat= CoOccMat(S, length(S), k); % co-occurrence matrix from graph

NetRep=SimNet(CoMat,k,dimension,CoMat);



end