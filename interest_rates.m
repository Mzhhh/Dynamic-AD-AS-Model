function [r, i] = interest_rates(t, Epi, Y)
    global alpha rho Ybar;
    [eps, ~] = shocks(t);
    r = (eps + Ybar - Y) / alpha + rho;
    i = r + Epi;
end