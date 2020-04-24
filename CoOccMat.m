function A_k = CoOccMat(A, num_nodes, step)



A = ScaleMat(A);                         %scale by row

A_k = zeros(num_nodes, num_nodes, step);

A_k(:,:,1) = A;

end