function [dEpi] = odefun(t, Epi)
    % return the derivative of Epi
    global A B C phi;    
    [eps, nu] = shocks(t);
    pi_star = inflation_target(t);
    f = A * pi_star + B * eps + nu / phi;
    dEpi = (f - A * Epi) / C;
end