%% Project 1
% Solutions for Antenna Patterns

%% Problem 1

N = 25;
lamda = 10;
x_y = [linspace(-50*pi/180,50*pi/180,200)' linspace(-50*pi/180,50*pi/180,200)'];
dn = [(0:1:N-1)' zeros(N,1) zeros(N,1)].*lamda/2;

figure(1);
E2 = AntennaPattern2D(x_y, dn, lamda, [0 0 0], hamming(N));
plot(x_y(:,1).*180/pi,E2(:,size(x_y,1)/2), 'blue');

hold on;

E2 = AntennaPattern2D(x_y, dn, lamda, [0 0 0], hann(N));
plot(x_y(:,1).*180/pi,E2(:,size(x_y,1)/2), 'red');

E2 = AntennaPattern2D(x_y, dn, lamda, [0 0 0], rectwin(N));
plot(x_y(:,1).*180/pi,E2(:,size(x_y,1)/2), 'black');
title('Problem 1(a)');
xlabel('Angle \theta_x (\circ)');
ylabel('Antenna Pattern (dB)');

legend('Hamming', 'Hanning', 'Rectangular');

hold off;

figure(4); 
E2 = AntennaPattern2D(x_y, dn, lamda, [0 0 0], rectwin(N));
surf(x_y(:,1).*180/pi,x_y(:,2).*180/pi,E2');
title('Problem 1(b)');
xlabel('Angle \theta_x (\circ)');
ylabel('Angle \theta_y (\circ)');
zlabel('Antenna Pattern (dB)');

%% Problem 2

lamda = 3e8/10e9;
x_y = [linspace(-89*pi/180,89*pi/180,200)' linspace(-89*pi/180,89*pi/180,200)'];

% A.

figure(5);
N = 13;
dn = [(0:1:N-1)' zeros(N,1) zeros(N,1)].*0.36/N;
E2 = AntennaPattern2D(x_y, dn, lamda, [0 0 0], rectwin(N));
plot(x_y(:,1).*180/pi,E2(:,size(x_y,1)/2));
title('Problem 2(a)');
xlabel('Angle \theta_x (\circ)');
ylabel('Antenna Pattern (dB)');

% B

figure(6);
N = 5;
dn = [(0:1:N-1)' zeros(N,1) zeros(N,1)].*0.36/N;
E2 = AntennaPattern2D(x_y, dn, lamda, [0 0 0], rectwin(N));
plot(x_y(:,1).*180/pi,E2(:,size(x_y,1)/2));
title('Problem 2(b)');
xlabel('Angle \theta_x (\circ)');
ylabel('Antenna Pattern (dB)');

% C

figure(7);
N = 5;
dn = [[0;1;4;9;11] zeros(N,1) zeros(N,1)].*0.36/11;
E2 = AntennaPattern2D(x_y, dn, lamda, [0 0 0], rectwin(N));
plot(x_y(:,1).*180/pi,E2(:,size(x_y,1)/2));
title('Problem 2(c)');
xlabel('Angle \theta_x (\circ)');
ylabel('Antenna Pattern (dB)');

%% Problem 3
lamda = 3e8/3e9;
direction = [linspace(-pi/2,pi/2,300)' linspace(-pi/2,pi/2,300)'];

figure(8);
scatter(d(:,1),d(:,2), 8);
xlabel('x');
ylabel('y');
title('Antenna Elements');

figure(9);
E2 = AntennaPattern2D(direction,d,lamda, [0 0 0], rectwin(size(d,1)));
surf(direction(:,1)*180/pi, direction(:,2)*180/pi, E2');
xlabel('Angle \theta_x (\circ)');
ylabel('Angle \theta_y (\circ)');
zlabel('Antenna Pattern (dB)');
title('Problem 3(b)');

figure(10);
direction = [linspace(-pi/2,pi/2,500)' linspace(-pi/2,pi/2,500)'];
zenith_pt = atan(sqrt(tan(0).^2 + tan(pi/4).^2));
azimuthal_pt = atan2(tan(0), tan(pi/4));
pointing = [sin(zenith_pt).*cos(azimuthal_pt) sin(zenith_pt).*sin(azimuthal_pt) cos(zenith_pt)];

E2 = AntennaPattern2D(direction, d, lamda, pointing, rectwin(size(d,1)));
plot(direction(:,1).*180/pi,E2(:,size(direction,1)/2));
title('Problem 3(c)');
xlabel('Angle \theta_x (\circ)');
ylabel('Antenna Pattern (dB)');
