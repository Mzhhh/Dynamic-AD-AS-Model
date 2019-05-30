function [pi_dev, Y_dev] = deviation(theta_pi, theta_Y)
    % fixed exogenous variables
    global phi alpha beta rho growth_rate;

    alpha = 1.0;  % responsiveness of demand to the real interest rate
    rho = 2.0;  % natural rate of interest
    phi = 0.25;  % responsiveness of inflation to output in the Phillips Curve

    growth_rate = 0.00;

    beta = 1;


    % derived values
    global A B C;
    A = (alpha * theta_pi) / (1 + alpha * theta_Y);
    B = 1 / (1 + alpha * theta_Y);
    C = (A + alpha * B + 1 / phi) / beta;


    % initial values
    global Ybar_init;
    tmin = -4;
    tmax = 5;
    incr = 0.001;
    tspan = tmin : incr: tmax;

    Ybar_init = 100;
    Epi_init = inflation_target(tmin);

    % solve the ODE for Epi
    [t, Epi] = ode45(@(t, y) odefun(t, y), tspan, Epi_init);


    % calculate other indogenous variables form Epi
    global Ybar;
    pi = inflation(t, Epi);
    Ybar = natural_output(t);
    Y = output(t, Epi, pi);
    pi_star = inflation_target(t);


    % maximum deviation form natural value
    Y_dev = max(abs(Y - Ybar));
    pi_dev = max(abs(pi - pi_star));

end