 function Alpha_mult = dotMult(Alpha,k)

        N=length(Alpha);

        Alpha_mult=ones(N,N);

        for i=1:k

            Alpha_mult= Alpha.* Alpha_mult;

        end

  end

  