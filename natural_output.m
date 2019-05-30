function Ybar = natural_output(t)
    global growth_rate Ybar_init;
    Ybar = Ybar_init * exp(growth_rate * t);
end