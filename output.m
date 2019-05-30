function Y = output(t, Epi, pi)
    global phi Ybar;
    [~, nu] = shocks(t);
    Y = Ybar + (pi - Epi - nu) / phi;
end