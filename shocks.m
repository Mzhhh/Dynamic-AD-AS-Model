function [demand_shock, supply_shock] = shocks(t)
    type = "supply";
    amp = 1;
    timescale = 0.5;
    % gaussian_pkt = normpdf(t, 0, timescale) * amp;
    truncated_pkt = amp * exp(- t.^2 / (2 * timescale^2));
    if type == "demand"
        demand_shock = amp * truncated_pkt;
        supply_shock = 0;
    elseif type == "supply"
        demand_shock = 0;
        supply_shock = amp * truncated_pkt;
    else
        demand_shock = 0;
        supply_shock = 0;
    end
end