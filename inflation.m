function pi = inflation(t, Epi)
    global A B C phi alpha beta;
    [eps, nu] = shocks(t);
    pi_star = inflation_target(t);
    pi = (A*pi_star + B*eps + nu/phi + (1/phi+alpha*B) * Epi) / (beta * C);
    
end