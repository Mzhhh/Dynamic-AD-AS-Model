theta_pi_range = 0 : 0.05 : 2;
theta_Y_range = 0 : 0.05 : 2;
[theta_pi_grid, theta_Y_grid] = meshgrid(theta_pi_range, theta_Y_range);
 
[m, n] = size(theta_pi_grid);
pi_dev_grid = zeros(m, n);
Y_dev_grid = zeros(m, n);
for i = 1 : m
    for j = 1 : n
        [pi_dev_grid(i, j), Y_dev_grid(i, j)] = deviation(theta_pi_grid(i, j), theta_Y_grid(i, j));
    end
end

figure("Position", [200, 100, 1400, 500]);

subplot(1, 2, 1);
surface(theta_pi_grid, theta_Y_grid, pi_dev_grid);
colormap(jet);
xlabel("$\theta_\pi$", "interpreter", "latex");
ylabel("$\theta_Y$", "interpreter", "latex");
title("$\max \vert \Delta \pi \vert$", "interpreter", "latex");
c1 = caxis;
colorbar;

subplot(1, 2, 2);
surface(theta_pi_grid, theta_Y_grid, Y_dev_grid);
colormap(jet);
xlabel("$\theta_\pi$", "interpreter", "latex");
ylabel("$\theta_Y$", "interpreter", "latex");
title("$\max \vert \Delta Y \vert$", "interpreter", "latex");
colorbar;
c2 = caxis;


% c3 = [min([c1 c2]), max([c1 c2])];
% caxis(c3);
% 
% subplot(1, 2, 1);
% caxis(c3);
% colorbar off;

