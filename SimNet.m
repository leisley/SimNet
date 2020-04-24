function NetRep = SimNet(CoMat, step, dim, A)



[num_nodes,q] = size(CoMat);



%Probability Transition Matrix and SVD

NetRep = zeros(num_nodes, step*dim);

for i = 1:step

    ProbMat = CalcProbMat(CoMat(:,:,i),A(:,:,i));

    Rk = RepUsingSVD(ProbMat, dim, 0.5);               %defalut value 0.5

    Rk = Rk./ ( repmat( sqrt(sum(Rk.^(2), 2)), 1, dim) );  

    NetRep(:, 1+dim*(i-1):dim*i) = Rk;                 %concatenation

end



NetRep(isnan(NetRep)==1) = 1;

end