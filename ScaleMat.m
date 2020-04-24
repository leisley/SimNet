function P = ScaleMat(P)



%scaling matrix 

P = P - diag(diag(P));  %diagonal elements must be 0

D = diag(sum(P), 0);    %degree matrix

P = D^(-1)*P;