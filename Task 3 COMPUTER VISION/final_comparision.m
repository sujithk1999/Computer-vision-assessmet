plot(Std_devi_abso_error,'r')
%legend('standard deviation of estimated co-ordinates')
hold on
plot(Std_devi_abso_error_NOISY,'b')
%egend('standard deviation of Noisy co-ordinates')
legend({'standard deviation of estimated co-ordinates of trageted trajectories','standard deviation of Noisy co-ordinates of trageted trajectories'}, 'Location', 'northwest')
hold off