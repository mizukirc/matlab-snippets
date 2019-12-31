figure
plot([1.8 2.3], 2, 'o', 'MarkerFaceColor', 'k', 'MarkerEdgeColor', 'none', 'MarkerSize', 10);
xlim([1.3 2.9]); ylim([1.6 2.4])
text(2,2, '\omega', 'FontSize', 40, 'FontName', 'Meiryo UI')
hold on
plot([1.65 1.7], [2.05 2.1], 'k', 'LineWidth', 2)
plot([2.5 2.45], [2.05 2.1], 'k', 'LineWidth', 2)

cx = 2.1; cy = 2; r = 0.4;
theta1 = linspace(7*pi/8, 9*pi/8, 100);
theta2 = linspace(-pi/8, pi/8, 100);
X	=	1.5*r*cos([theta1 theta2]) + cx;
Y	=	r*sin([theta1 theta2]) + cy;

plot(X, Y, '.k')

title('ÅiÅLÅEÉ÷ÅEÅMÅj')
hold off