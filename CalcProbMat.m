function ProbMat = CalcProbMat(CoMat,A)

[p, q] = size(CoMat);

assert(p==q, 'M must be a square matrix!');



ProbMat = log(CoMat ./ repmat(sum(A), p, 1)) - log(1/p);



ProbMat(ProbMat<0)=0;     % must be positive

IdxNan = isnan(ProbMat);

ProbMat(IdxNan) = 0;

end