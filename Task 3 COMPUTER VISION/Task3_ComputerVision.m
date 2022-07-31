x_real_coord=csvread('x.csv');
y_real_coord=csvread('y.csv');
a_noisy_coord=csvread('a.csv');
b_noisy_coord=csvread('b.csv');

%plotting  the real and noisy co-ordinates of target trajectories.
plot(x_real_coord, y_real_coord, '+r');
hold;
plot(a_noisy_coord, b_noisy_coord, '+gr');

%mean and standard deviation
nx = a_noisy_coord-x_real_coord;
ny = b_noisy_coord-y_real_coord;
mean(nx)
mean(ny)
std(nx)
std(ny)

% plot histogram for nx and ny
histogram(nx,5)
histogram(ny,5)
plot(x_real_coord, y_real_coord, '+r');
hold;
plot(a_noisy_coord, b_noisy_coord, '+gr');
title('noise graph')

%with the help of kalman tracking for assess the quality of tracking
z=[a_noisy_coord;b_noisy_coord]
[px, py] = kalmanTracking(z)

nnx = px-x_real_coord;
nny = py-y_real_coord;
mean(nx)
mean(ny)
plot(x_real_coord, y_real_coord, '+r');
hold on
plot(a_noisy_coord, b_noisy_coord, '+gr');
hold off

plot(x_real_coord,y_real_coord, '+r', px, py, 'b', a_noisy_coord,b_noisy_coord,'+gr');
legend({'x,y = real co-ordinates of target trajectories(x,y)','px,py = predicted co-ordinates(x,y) of target trajectories','a,b = noisy co-ordinates(a,b) of target trajectories'}, 'Location', 'northwest')


% Calculating the mean and standard deviation of absolute error and Root mean squared error for estimated value

Std_devi_abso_error = sqrt( ((x_real_coord-px).^2) + ((y_real_coord-py).^2) )
RMS_error = rms(Std_devi_abso_error)

% Calculating the mean and standard deviation of absolute error and Root mean squared error for Noisy Co-ordinates value

Std_devi_abso_error_NOISY = sqrt( ((x_real_coord-a_noisy_coord).^2) + ((y_real_coord-b_noisy_coord).^2) )
RMS_error_NOISY = rms(Std_devi_abso_error_NOISY)







