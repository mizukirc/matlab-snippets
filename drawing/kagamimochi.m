close all;

%% éñëOê›íË
[x,y,z] = sphere(50);
z_times = 1.3;
z_max = max(z(:));

% ótÇ¡Çœê›íË
happa_pt1 = [0 0 z_max*z_times];
happa_pt2 = [0 0.5 z_max*z_times+0.5];
x1_half = linspace(happa_pt1(1), 0.19, 7) + [0 0.05 0.065 0.065 0.05 0.03 0.005];
happa_x = [x1_half 0.2 fliplr(x1_half)];
happa_y = linspace(happa_pt1(2), happa_pt2(2), 15);
happa_z = linspace(happa_pt1(3), happa_pt2(3), 15);


%% ãæñ›ÇÃï`âÊ
figure;
mikan = surf(x/z_times,y/z_times,z*z_times, 'EdgeColor', 'none', 'FaceColor', [1 0.6 0]);
hold on;
omochi_ue = surf(x*1.4, y*1.4, z-(z_max*z_times+z_max), 'EdgeColor', 'none', 'FaceColor', 'w');
omochi_shita = surf(x*1.9, y*1.9, z-(z_max*z_times+z_max*3), 'EdgeColor', 'none', 'FaceColor', 'w');
happa_r = patch(happa_x, happa_y, happa_z, [0.5 0.7 0.3],  'EdgeColor', [0.4 0.7 0.4]);
happa_l = patch(-happa_x, happa_y, happa_z, [0.5 0.7 0.3],  'EdgeColor', [0.4 0.7 0.4]);

hold off

axis square
camlight

