function R = RepUsingSVD(ProbMat, dim, alpha)



[U, S, V] = svd(ProbMat);



Ud = U(:,1:dim);

Sd = S(1:dim,1:dim);

R = Ud * Sd^(alpha);

end