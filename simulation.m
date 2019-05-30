% fixed exogenous variables
global phi alpha beta rho growth_rate;

alpha = 1.0;  % responsiveness of demand to the real interest rate
rho = 2.0;  % natural rate of interest
phi = 0.25;  % responsiveness of inflation to output in the Phillips Curve

theta_pi = 0.5;  % central bank's response to interest rate deviation 
theta_Y = 0.5;  % central bank's response to output deviation

growth_rate = 0.00;

beta = 1;


% derived values
global A B C;
A = (alpha * theta_pi) / (1 + alpha * theta_Y);
B = 1 / (1 + alpha * theta_Y);
C = (A + alpha * B + 1 / phi) / beta;


% initial values
global Ybar_init;
tmin = -2;
tmax = 18;
incr = 0.001;
tspan = tmin : incr: tmax;

Epi_init = inflation_target(tmin);
Ybar_init = 100;
r_init = rho;


% solve the ODE for Epi
[t, Epi] = ode45(@(t, y) odefun(t, y), tspan, Epi_init);


% calculate other indogenous variables form Epi
global Ybar;
pi = inflation(t, Epi);
Ybar = natural_output(t);
Y = output(t, Epi, pi);
[r, i] = interest_rates(t, Epi, Y); 
pi_star = inflation_target(t);


% maximum deviation form natural value
Y_dev = max(abs(Y - Ybar));
pi_dev = max(abs(pi - pi_star));
fprintf("theta_pi: %.2f, theta_Y: %.2f\n", theta_pi, theta_Y);
fprintf("pi_dev: %.3f, Y_dev: %.3f\n", pi_dev, Y_dev);


% plot figures
plot = true;
if (plot)
    clear plot
    figure("Position", [300, 0, 800, 1000]);

    subplot(3, 1, 1);
    hold on
    plot(t, [pi, Epi]);
    hold off
    legend("Actual Inflation", "Expected Inflation");
    xlabel("$t$", "Interpreter", "latex");
    ylabel("$\pi$", "Interpreter", "latex");

    subplot(3, 1, 2);
    hold on
    plot(t, Y);
    plot(t, Ybar, "k:");
    hold off
    xlabel("$t$", "Interpreter", "latex");
    ylabel("$Y$", "Interpreter", "latex");
    legend("Output", "Natural Output");


    subplot(3, 1, 3);
    plot(t, [r i]);
    legend("Real Interest Rate", "Nominal Interest Rate");
    xlabel("$t$", "Interpreter", "latex");
    ylabel("$r_t$", "Interpreter", "latex");
    
end





